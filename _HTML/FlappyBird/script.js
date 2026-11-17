var block = document.getElementById("block");
var hole = document.getElementById("hole");
var character = document.getElementById("character");

var jumping = 0;


document.getElementById("game_header").innerHTML = "This is your Flappy Bird Game";


block.addEventListener("animationiteration", () => {
    setRandomPos(block);
    setRandomPos(hole);
});

setInterval(function ()  {
    movePlayer();
    document.getElementById("debug").innerHTML = "Character top: " + parseInt(window.getComputedStyle(character).getPropertyValue("top"));
}, 10);

function movePlayer()
{
    if (jumping == 0)
    {
        var charPos = parseInt(window.getComputedStyle(character).getPropertyValue("top"));
        character.style.top = (charPos + 3) + "px";

    }
}

function jump()
{
    jumping = 1;
    jumpCount = 0;
    jumpInterval = setInterval(function () {

        var charpos = parseInt(window.getComputedStyle(character).getPropertyValue("top"));
        character.style.top = (charpos - 6) + "px";
        jumpCount+=1;
        //if (charpos <= 50)
        //{
        //    clearInterval(jumpInterval);
         //   jumping = 0;
         //   jumpCount = 0;
       // }
        if (jumpCount > 20)
        {
            clearInterval(jumpInterval);
            jumping = 0;
            jumpCount = 0;
        }

    });
}

function setRandomPos(element)
{
    var random = ( Math.random() * 300 )+ 150;
    element.style.top = random +"px";
}