let allbtn = document.getElementById("all")
let technikbtn = document.getElementById("technik")
let burobtn = document.getElementById("buro")
let angebotebtn = document.getElementById("angebote")



function selection(btn)
{
    allbtn.classList.remove("sel")
    technikbtn.classList.remove("sel")
    burobtn.classList.remove("sel")
    angebotebtn.classList.remove("sel")



    btn.classList.add("sel")

}


function showSelection(mode)
{
    let techselection=document.querySelectorAll(".item")
    
    for (var i of techselection){
        i.style.display="none";
    }

 


    //offers
    if (mode=="offer"){
  
        let allselection=document.querySelectorAll(".offer")

        for (var i of allselection){
            i.style.display=""
        }
        
        return; 
    }
    //Selection all
    if (mode=="all"){
       
        let allselection=document.querySelectorAll(".item")

        for (var i of allselection){
            i.style.display=""
        }
        
        return; 
    }
    

    //Filtering mode
    let str = ( mode=="tech"  ) ? ".tech" : ".buro"

    let newselection = document.querySelectorAll(str)

    for (var i of newselection){
        i.style.display = ""
    }

}

function showAll()
{
    selection(allbtn)
    showSelection("all")
}

function showTechnik()
{
    selection(technikbtn)
     showSelection("tech")
}

function showBuro()
{
    selection(burobtn)
     showSelection("buro")
}

function showAngebot()
{
    selection(angebotebtn)
    showSelection("offer")
}


allbtn.onclick=showAll
technikbtn.onclick=showTechnik
burobtn.onclick=showBuro
angebotebtn.onclick=showAngebot