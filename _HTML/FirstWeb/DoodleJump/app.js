
document.addEventListener("DOMContentLoaded", function() {
    document.addEventListener("keydown", control);
    document.addEventListener("keyup", function () {clearInterval(walkLeftId); clearInterval(walkRightId); walking = false;});

    const grid = document.querySelector(".grid");
    const doodler = document.createElement("div");

    let startPoint = 150;
    var doodlerPositionLeft = 150;
    var doodlerPositioBottom = startPoint;

    let platformCount = 5;
    let platforms = [];

    let gameOver = false;

    let isJumping = false;

    let upTimerId;
    let downTimerId;

    let walking = false;

    function createDoodler()
    {
        doodler.classList.add("doodler")
        grid.appendChild(doodler);

        //get first platform
        let firstPlatform = platforms[0];
        doodlerPositioBottom = firstPlatform.bottom + 15;
        doodlerPositionLeft = firstPlatform.left;

        doodler.style.left = createPosArg(doodlerPositionLeft);
        doodler.style.bottom = createPosArg(doodlerPositioBottom);
        jump();
    }

    function jump()
    {
        if (isJumping) return;

        clearInterval(downTimerId);
        isJumping = true;
        upTimerId =  setInterval(function() {
            doodlerPositioBottom += 20;
            doodler.style.bottom = createPosArg(doodlerPositioBottom);

            if (doodlerPositioBottom > startPoint + 200)
            {
                fall();
            }

        },30);


    }
    function fall()
    {
        
        clearInterval(upTimerId);
        isJumping = false;

        downTimerId = setInterval(function() {

            doodlerPositioBottom -= 5;
            doodler.style.bottom = createPosArg(doodlerPositioBottom);

            if (doodlerPositioBottom <= 0)
            {
                //clearInterval(downTimerId);
                GameOver();
            }

            platforms.forEach(platform => {
                if (doodlerPositioBottom >= platform.bottom  && 
                    doodlerPositioBottom <= platform.bottom+ 15 && 
                    doodlerPositionLeft + 60 >= platform.left &&
                    doodlerPositionLeft <= platform.left + 85

                ){
                    clearInterval(downTimerId);
                    startPoint = doodlerPositioBottom;
                    jump();
                }
            })
            

        },30)


    }

    class Platform {
        constructor(newPlatformBottom)
        {
            this.bottom = newPlatformBottom;
            this.left = Math.random() * 360; //document.querySelector(".grid").clientWidth;
            this.visual =document.createElement("div");
            const visual = this.visual;

            visual.classList.add("platform");
            visual.style.left = createPosArg(this.left);
            visual.style.bottom = createPosArg(this.bottom);
            grid.appendChild(visual);

        }
    }

    function createPlatforms()
    {
        for( let i = 0; i < platformCount; i++){
            let platformGap = 600 / platformCount;

            let newPlatformBottom = platformGap * i;

            let newPlatform = new Platform(newPlatformBottom);
            platforms.push(newPlatform);
        }

        platforms.forEach(platform => console.log(platform));
    }
    function movePlatforms()
    {
        if (doodlerPositioBottom > 200)
            {
            platforms.forEach(platform => {
                platform.bottom -= 4;
                let visual = platform.visual;
                visual.style.bottom = createPosArg(platform.bottom);


            if (platform.bottom < -10){
                let firstPlatformVisual = platforms[0].visual;

                
                firstPlatformVisual.classList.remove("platform");
                
                //Removes first item from array ( like pop )
                platforms.shift();

                let newPlatform = new Platform(600);
                platforms.push(newPlatform);
            }
        })
    }
    }
    let walkLeftId
    let walkRightId
    function walkLeft()
    {
        clearInterval(walkRightId);

        walkLeftId = setInterval(function() {


            if (gameOver){ console.log("Returned from walkRigth beccause game over"); clearInterval(walkLeftId); return;}


            if (doodlerPositionLeft >= 0)
            {
                walking = true;
                doodlerPositionLeft -= 5;
                let visual = document.querySelector(".doodler");
                if (visual != null){
                visual.style.left = createPosArg(doodlerPositionLeft);
                }
            }else{
                walking = false;
                clearInterval(walkLeftId);
            }

        },30)

    }
    function walkRigth()
    {
        clearInterval(walkLeftId);

        

        walkRightId = setInterval(function() {

            if (gameOver){ console.log("Returned from walkRigth beccause game over"); clearInterval(walkRightId); return;}


            if (doodlerPositionLeft <= 340)
            {
                walking = true;
                doodlerPositionLeft += 5;
                let visual = document.querySelector(".doodler");
                if (visual != null){
                    visual.style.left = createPosArg(doodlerPositionLeft);

                }
            }else{
                doodlerPositionLeft = 320;
                walking = false;
                clearInterval(walkRightId);
            }

        },30)
    }

    function control(e)
     {
        if (walking) return;    
        if (gameOver) return;
        if (e.key === "ArrowLeft")
        {
            walkLeft();
            console.log("left");
        }else if (e.key === "ArrowRight"){
            walkRigth();
            console.log("right");
        } else if (e.key === "ArrowUp"){
            console.log("up");
        }else if (e.key === "space"){
            console.log("space");
        }
     }
     let moveId;
    function start(){
        if (!gameOver){
            createPlatforms()
            createDoodler()
            clearInterval(moveId);
            moveId = setInterval(movePlatforms, 30);
        }

    }

    function resetGame()
    {

        clearInterval(upTimerId);
        clearInterval(downTimerId);
        while (grid.firstChild)
        {
            grid.removeChild(grid.firstChild);
            platforms = [];
        }
    }
    function GameOver()
    {
        console.log("game over");
        gameOver = true;
        
        resetGame()
        grid.innerHTML = "<h2> Your Game Ended...</h2> <br> <button id='replayButton'>Play Again</button>";
        document.getElementById("replayButton").addEventListener("click", function() {
            grid.innerHTML = "";
            resetGame();
            gameOver = false;
            start();
        });
    }


    start();

    
    jump()
    
    setInterval(function ()
    {
        console.log(gameOver);
    }
    , 30);

});



function createPosArg(value)
{
    return value + "px";
}







