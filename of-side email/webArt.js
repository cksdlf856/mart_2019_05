
    window.onload = function (){
        //document.getElementById('div_animation').style.transition = "all 2s";
        //animation_one();


        // document.getElementById("test1").style.transition = "all 2s";
        
        // document.getElementById("test1").style.width = "40px";
        // document.getElementById("test1").style.left = "40px";
        // document.getElementById("test1").style.top = "40px";

        //createCanvas();

    }

    let validation = (obj) => {
        
        if ("ipt_nm"===obj.id) {
         
            if ( 2 > obj.value.length ) {
                //alert("이름은 두글자 이상 입니다.");
                //obj.focus();
                //return false;
            }

        } else if ("ipt_pw"===obj.id) {
            
            if ( 6 > obj.value.length ) {
                //alert("비밀번호는 여섯글자 이상 입니다.");
                //obj.focus();
                //return false;
            }


        }
    }

    let speed = 2;

    let count = 0;
    let randomX = 0;
    let randomY = 0;
    let randomW1 = 0;
    let randomW2 = 0;
    let randomW3 = 0;

    let animation_one_switch = "on";

    let animation_one = () => {
        document.getElementById('div_animation').style.transition = "all 7s";

        randomX = Math.floor(Math.random() * 90);
        randomY = Math.floor(Math.random() * 60);
        randomW1 = Math.floor(Math.random() * 10);
        randomW2 = Math.floor(Math.random() * 100);
        randomW3 = Math.floor(Math.random() * 500);
        
        
        if ( 0 == count ) {
            document.getElementById('div_animation').style.top = randomY+"%";

            document.getElementById('div_animation').style.width = randomW1+"px";
            document.getElementById('div_animation').style.height = randomW1+"px";
        } else if ( 200 == count ) {
            document.getElementById('div_animation').style.left = randomX+"%";
            
            document.getElementById('div_animation').style.width = randomW2+"px";
            document.getElementById('div_animation').style.height = randomW2+"px";

        } else if ( 400 == count ) {
            document.getElementById('div_animation').style.top = randomY+"%";
            
            document.getElementById('div_animation').style.width = randomW3+"px";
            document.getElementById('div_animation').style.height = randomW3+"px";

        } else if ( 600 == count ) {
            document.getElementById('div_animation').style.left = randomX+"%";
            
            document.getElementById('div_animation').style.width = randomW2+"px";
            document.getElementById('div_animation').style.height = randomW2+"px";

            count = -200;
        }
        
        count += 1;

        if ( "on" == animation_one_switch ) {
            requestAnimationFrame(animation_one);
        }
    }

    let div_copy = (obj) => {

        createChapter();
        createCell();
    
    }

    let createChapter = () => {

        let div ;
        for ( let i = 1 ; i <= 8 ; i++ ) {

            div = parent.document.createElement("div");
            div.style.position = "absolute";
            div.style.width = "0px";
            div.style.height = "0px";
            div.style.top = "0px";
            div.style.left = "0px";
            div.style.backgroundColor = "white";
            div.style.borderRadius = "50px";
            div.style.zIndex = 2;
            div.style.transition = "all 2s";

            div.id = "chapter"+i;

            if ( 8 == i ) {
                div.style.backgroundColor = "rgb(30,30,30)";
            }

            if ( null == document.getElementById("chapter"+i) ) {

                parent.document.getElementById("div_chapter").appendChild(div);
            }
        }
        chapterAnimation();
    }

    let chapterCount = 0 ;

    let chapterAnimation = () => {

        if ( 10 == chapterCount ) {

            document.getElementById("chapter1").style.top = "-160px";
            document.getElementById("chapter1").style.left = "50px";
            document.getElementById("chapter1").style.width = "4px";
            document.getElementById("chapter1").style.height = "4px";

            document.getElementById("chapter2").style.top = "-160px";
            document.getElementById("chapter2").style.left = "50px";
            document.getElementById("chapter2").style.width = "4px";
            document.getElementById("chapter2").style.height = "4px";

            document.getElementById("chapter3").style.top = "-160px";
            document.getElementById("chapter3").style.left = "50px";

            document.getElementById("chapter4").style.top = "-160px";
            document.getElementById("chapter4").style.left = "50px";

            document.getElementById("chapter5").style.top = "-160px";
            document.getElementById("chapter5").style.left = "50px";

            document.getElementById("chapter6").style.top = "-160px";
            document.getElementById("chapter6").style.left = "50px";

            document.getElementById("chapter7").style.top = "-160px";
            document.getElementById("chapter7").style.left = "50px";

            document.getElementById("chapter8").style.top = "-160px";
            document.getElementById("chapter8").style.left = "50px";

        } else if ( 100 == chapterCount ) {
            
            document.getElementById("chapter2").style.height = "1px";
            document.getElementById("chapter2").style.top = "-159px";
            document.getElementById("chapter2").style.left = "63px";

        } else if ( 120 == chapterCount ) {

            document.getElementById("chapter2").style.width = "20px";

            document.getElementById("chapter3").style.top = "-160px";
            document.getElementById("chapter3").style.left = "91px";

            document.getElementById("chapter4").style.top = "-160px";
            document.getElementById("chapter4").style.left = "91px";

        } else if ( 140 == chapterCount ) {

            document.getElementById("chapter3").style.width = "4px";
            document.getElementById("chapter3").style.height = "4px";

        } else if ( 180 == chapterCount ) {

            document.getElementById("chapter4").style.height = "1px";
            document.getElementById("chapter4").style.top = "-159px";
            document.getElementById("chapter4").style.left = "104px";

        } else if ( 200 == chapterCount ) {

            document.getElementById("chapter4").style.width = "20px";

            document.getElementById("chapter5").style.top = "-160px";
            document.getElementById("chapter5").style.left = "132px";

            document.getElementById("chapter6").style.top = "-160px";
            document.getElementById("chapter6").style.left = "132px";            

        } else if ( 220 == chapterCount ) {

            document.getElementById("chapter5").style.width = "4px";
            document.getElementById("chapter5").style.height = "4px";

        } else if ( 260 == chapterCount ) {

            document.getElementById("chapter6").style.height = "1px";
            document.getElementById("chapter6").style.top = "-159px";
            document.getElementById("chapter6").style.left = "145px";

        } else if ( 280 == chapterCount ) {

            document.getElementById("chapter6").style.width = "20px";

            document.getElementById("chapter7").style.top = "-160px";
            document.getElementById("chapter7").style.left = "173px";

        } else if ( 300 == chapterCount ) {

            document.getElementById("chapter7").style.width = "4px";
            document.getElementById("chapter7").style.height = "4px";

            document.getElementById("chapter8").style.width = "4px";
            document.getElementById("chapter8").style.height = "4px";

        } else if ( 380 == chapterCount ) {

            document.getElementById("chapter8").className = "chapter8";

        }
        
        chapterCount += (1*speed);

        requestAnimationFrame(chapterAnimation);

    }

    let headPaintSwitch = 1;
    let planetPaintSwitch = 1;
    
    let paintCount = 0;
    let paintCloseCount = 0;

    let obj = "";

    let createCell = () => {
        let divCreateIdBlock = "";
        let div ;
        for ( let i = 1 ; i <= 5 ; i++ ) {
            div = parent.document.createElement("div");
            div.innerText = " ";
            div.style.backgroundColor = "white";
            div.style.width = "4px";
            div.style.height = "4px";
            div.style.position = "absolute";
            div.style.borderRadius = "100px";
            div.style.top = "0px";
            div.style.left = "0px";
            div.style.transition = "all 2s";

            if ( 1 == i ) {
                div.id = "div_head";
                divCreateIdBlock = "div_head";
                div.style.zIndex= 2;
                div.addEventListener('click', function(){
                    headPaintSwitch = headPaintSwitch * -1;
                    if ( -1 == headPaintSwitch ) {
                        paintCount = 0;
                        obj = "head";
                        paint();
                    } else if ( 1 == headPaintSwitch ) {
                        paintCloseCount = 0;
                        paintClose();
                    }
                });
            } else if ( 2 == i ) {
                div.id = "div_leftEyes";
                divCreateIdBlock = "div_leftEyes";
            } else if ( 3 == i ) {
                div.id = "div_RightEyes";
                divCreateIdBlock = "div_RightEyes";
            } else if ( 4 == i ) {
                div.id = "div_body";
                divCreateIdBlock = "div_body";
            } else if ( 5 == i ) {
                div.id = "div_planet";
                divCreateIdBlock = "div_planet";
                div.addEventListener('click', function(){
                    planetPaintSwitch = planetPaintSwitch * -1;
                    if ( -1 == planetPaintSwitch ) {
                        paintCount = 0;
                        obj = "planet";
                        paint();
                    } else if ( 1 == planetPaintSwitch ) {
                        paintCloseCount = 0;
                        paintClose();
                    }
                }); 
            }
            
            if ( null == document.getElementById(divCreateIdBlock) ) {

                parent.document.getElementById("div_cell").appendChild(div);
            }
        }   
        cellAnimation();
    }

    let cellCount = 0;

    let cellAnimation = () =>{

        if ( 10 == cellCount ) { //0으로 하면 실행속도 차이로 처음 transition이 발생하지 않는다.
            document.getElementById('div_animation').style.left = "38%";
            
            document.getElementById('div_head').style.left = "40px";
            document.getElementById('div_leftEyes').style.left = "40px";
            document.getElementById('div_RightEyes').style.left = "40px";
            document.getElementById('div_body').style.left = "40px";
            document.getElementById('div_planet').style.left = "40px";
            
        } else if ( 80 == cellCount ) {

            document.getElementById('div_head').style.left = "100px";
            document.getElementById('div_head').style.top = "-40px";

        } else if ( 110 == cellCount ) {

            document.getElementById('div_leftEyes').style.left = "90px";
            document.getElementById('div_leftEyes').style.top = "0px";

            document.getElementById('div_RightEyes').style.left = "110px";
            document.getElementById('div_RightEyes').style.top = "0px";

        } else if ( 140 == cellCount ) {

            document.getElementById('div_body').style.left = "100px";
            document.getElementById('div_body').style.top = "40px";

        } else if ( 170 == cellCount ) {

            document.getElementById('div_planet').style.left = "100px";
            document.getElementById('div_planet').style.top = "90px";

        } else if ( 270 == cellCount ) {

            document.getElementById('div_head').style.transition = "all 3s";
            document.getElementById('div_head').style.width= "45px";

        } else if ( 320 == cellCount ) {
           
            document.getElementById('div_head').style.transition = "all 2s";
            document.getElementById('div_head').style.height= "50px";

            document.getElementById('div_leftEyes').style.top = "40px";
            document.getElementById('div_RightEyes').style.top = "40px";
            document.getElementById('div_body').style.top = "80px";
            document.getElementById('div_planet').style.top = "120px";

        } else if ( 400 == cellCount ) {

            document.getElementById('div_body').style.transition = "all 2s";
            document.getElementById('div_body').style.width = "30px";

        } else if ( 430 == cellCount ) {

            document.getElementById('div_body').style.height = "25px";

            document.getElementById('div_planet').style.top = "140px";

        } else if ( 460 == cellCount ) {

            document.getElementById('div_body').style.borderRadius= "5px";

        } else if ( 540 == cellCount ) {

            document.getElementById('div_body').style.top = "0px";
            document.getElementById('div_body').style.left = "108px";

            document.getElementById('div_leftEyes').style.left = "40px";
            document.getElementById('div_RightEyes').style.left = "60px";

            document.getElementById('div_planet').style.top = "80px";
            document.getElementById('div_planet').style.left = "150px";

        } else if ( 640 == cellCount ) {

            document.getElementById('div_leftEyes').style.top = "-26px";
            document.getElementById('div_RightEyes').style.top = "-26px";
            document.getElementById('div_leftEyes').style.left = "119px";
            document.getElementById('div_RightEyes').style.left = "131px";

            document.getElementById('div_leftEyes').style.border = " 0.1px rgb(30,30,30) solid ";
            document.getElementById('div_RightEyes').style.border = " 0.1px rgb(30,30,30) solid ";

            document.getElementById('div_leftEyes').style.zIndex = 3;
            document.getElementById('div_RightEyes').style.zIndex = 3;

            document.getElementById('div_leftEyes').style.width = "3.5px";
            document.getElementById('div_leftEyes').style.height = "4.5px";

            document.getElementById('div_RightEyes').style.width = "3.5px";
            document.getElementById('div_RightEyes').style.height = "4.5px";

        } else if ( 690 == cellCount ) {

            document.getElementById('div_planet').style.transition = "all 3s";

            document.getElementById('div_planet').style.top = "15px";
            document.getElementById('div_planet').style.left = "60px";

            document.getElementById('div_planet').style.width = "120px";
            document.getElementById('div_planet').style.height = "120px";

        } else if ( 810 == cellCount ) {

            document.getElementById('div_head').style.backgroundColor = "rgb(255,192,152)"

        } else if ( 850 == cellCount ) {

            document.getElementById('div_leftEyes').style.height = "1px";
            document.getElementById('div_RightEyes').style.height = "1px";

        } else if ( 950 == cellCount ) {

            document.getElementById('div_leftEyes').style.border = "none";
            document.getElementById('div_RightEyes').style.border = "none";

            document.getElementById('div_leftEyes').style.backgroundColor = "rgb(30,30,30)";
            document.getElementById('div_RightEyes').style.backgroundColor = "rgb(30,30,30)";

        } else if ( 1000 == cellCount ) {

            document.getElementById('div_leftEyes').style.height = "4.5px";
            document.getElementById('div_RightEyes').style.height = "4.5px";

        } else if ( 1100 == cellCount ) {

            document.getElementById('div_leftEyes').className = "div_leftEyes";
            document.getElementById('div_RightEyes').className = "div_RightEyes";

        } else if ( 1200 == cellCount ) {

            document.getElementById('div_body').style.backgroundColor = "rgb(124, 124, 124)";
            document.getElementById('div_body').style.zIndex = 1;
            document.getElementById('div_body').style.boxShadow = "0px 10px 15px 5px #2c2c2c";
            //document.getElementById('div_head').style.background = "linear-gradient( to bottom, rgb(255,192,152) ,rgb(255,192,152))"; 
            document.getElementById('div_head').style.background = "linear-gradient( to bottom, rgb(255,192,152) 70%, rgb(255, 235, 59),#2196f3)"; 

        } else if ( 1250 == cellCount ) {

            document.getElementById('div_planet').style.background = "linear-gradient( to bottom, white 40%, rgb(3, 169, 244))";
            //document.getElementById('div_planet').style.background = "linear-gradient( to bottom, rgb(255,192,152), rgb(255,192,152))";
            document.getElementById('div_planet').style.cursor = "pointer";

            document.getElementById('div_head').style.cursor = "pointer";
            createPlanet();

            //document.getElementById("chapter8").style.left = "91px";

        } 

        cellCount += (1*speed);
        
        requestAnimationFrame(cellAnimation);
    }

    let createPlanet = () => {

        let div ;
        for ( let i = 1 ; i <= 5 ; i++ ) {
            div = parent.document.createElement("div");
            div.innerText = " ";
            div.style.backgroundColor = "white";
            div.style.width = "4px";
            div.style.height = "4px";
            div.style.position = "absolute";
            div.style.borderRadius = "100px";
            div.style.top = "70px";
            div.style.left = "120px";
            div.style.cursor = "pointer";
            div.style.transition = "all 2s";

            if ( 1 == i ) {
                div.id = "div_planet_1";
                div.addEventListener("click",function () {
                
                    planetSubCount1 = 0;
                    planetSubAnimation1();
                    
                });
            } else if ( 2 == i ) {
                div.id = "div_planet_2";
                div.addEventListener("click",function () {
                
                    planetSubCount2 = 0;
                    planetSubAnimation2();
                    
                });
            } else if ( 3 == i ) {
                div.id = "div_planet_3";
                div.addEventListener("click",function () {
                
                    planetSubCount3 = 0;
                    planetSubAnimation3();
                    
                });
            } else if ( 4 == i ) {
                div.id = "div_planet_4";
                div.addEventListener("click",function () {
                
                    planetSubCount4 = 0;
                    planetSubAnimation4();
                    
                });
            } else if ( 5 == i ) {
                div.id = "div_planet_5";
                div.addEventListener("click",function () {
                
                    planetSubCount5 = 0;
                    planetSubAnimation5();
                    
                });
            }

            if ( null == document.getElementById("div_planet_"+i) ) {

                parent.document.getElementById("div_cell").appendChild(div);
            }
        } 

        planetAnimation();

    }

    let planetCount = 0;

    let planetAnimation = () => {

        if ( 10 == planetCount ) {

            document.getElementById("div_planet_1").style.top = "200px";
            document.getElementById("div_planet_2").style.top = "200px";
            document.getElementById("div_planet_3").style.top = "200px";
            document.getElementById("div_planet_4").style.top = "200px";
            document.getElementById("div_planet_5").style.top = "200px";

        } else if ( 100 == planetCount ) {

            document.getElementById("div_planet_1").style.top = "-100px";
            document.getElementById("div_planet_2").style.top = "100px";
            document.getElementById("div_planet_3").style.top = "200px";
            document.getElementById("div_planet_4").style.top = "-130px";
            document.getElementById("div_planet_5").style.top = "50px";

            document.getElementById("div_planet_1").style.left = "-250px";
            document.getElementById("div_planet_2").style.left = "-300px";
            document.getElementById("div_planet_3").style.left = "350px";
            document.getElementById("div_planet_4").style.left = "400px";
            document.getElementById("div_planet_5").style.left = "500px";

        } else if ( 200 == planetCount ) {

            document.getElementById("div_planet_1").style.width = "1px";
            document.getElementById("div_planet_2").style.width = "1px";
            document.getElementById("div_planet_3").style.width = "1px";
            document.getElementById("div_planet_4").style.width = "1px";
            document.getElementById("div_planet_5").style.width = "1px";

            document.getElementById("div_planet_1").style.height = "1px";
            document.getElementById("div_planet_2").style.height = "1px";
            document.getElementById("div_planet_3").style.height = "1px";
            document.getElementById("div_planet_4").style.height = "1px";
            document.getElementById("div_planet_5").style.height = "1px";

        } else if ( 250 == planetCount ) {

            document.getElementById("div_planet_1").style.backgroundColor = "#ffeb3b";
            document.getElementById("div_planet_2").style.backgroundColor = "#ff5722";
            document.getElementById("div_planet_3").style.backgroundColor = "#03a9f4";
            document.getElementById("div_planet_4").style.backgroundColor = "#9c27b0";
            document.getElementById("div_planet_5").style.backgroundColor = "#00ce00";
            
        } else if ( 300 == planetCount ) {
            
            document.getElementById("div_planet_1").className = "div_planet_1";
            document.getElementById("div_planet_2").className = "div_planet_2";
            document.getElementById("div_planet_3").className = "div_planet_3";
            document.getElementById("div_planet_4").className = "div_planet_4";
            document.getElementById("div_planet_5").className = "div_planet_5";

        }

        planetCount += (1*speed);
        requestAnimationFrame(planetAnimation);
    }

    let planetSubCount1 = 0;

    let planetSubAnimation1 = () => {

        if ( 10 == planetSubCount1 ) {

            document.getElementById("div_planet_1").style.animationName = "planetAnimation1_1";
            document.getElementById("div_planet_1").style.animationFillMode = "forwards";
            document.getElementById("div_planet_1").style.animationIterationCount = 1;

        } 

        planetSubCount1 += 1;
        requestAnimationFrame(planetSubAnimation1);
    }

    let planetSubCount2 = 0;
    let planetSubAnimation2 = () => {

        if ( 10 == planetSubCount2 ) {

            document.getElementById("div_planet_2").style.animationName = "planetAnimation2_1";
            document.getElementById("div_planet_2").style.animationDelay = "0s";
            document.getElementById("div_planet_2").style.animationFillMode = "forwards";
            document.getElementById("div_planet_2").style.animationIterationCount = 1;

        } 

        planetSubCount2 += 1;
        requestAnimationFrame(planetSubAnimation2);

    }

    let planetSubCount3 = 0;
    let planetSubAnimation3 = () => {
        
    }

    let planetSubCount4 = 0;
    let planetSubAnimation4 = () => {
        
    }

    let planetSubCount5 = 0;
    let planetSubAnimation5 = () => {
        
    }

    let paint = () => {

        let div;
        for ( let i = 1 ; i <= 7 ; i++ ) {
            
            div = parent.document.createElement("div");
            div.style.position = "absolute";
            div.style.width = "0px";
            div.style.height = "0px";
            div.style.borderRadius = "50px";
            div.style.top = "0px";
            div.style.left = "-25px";
            div.style.backgroundColor = "white";
            div.style.transition = "all 2s";
            div.style.cursor = "pointer";
            div.id = "div_paint"+i;

            div.addEventListener("click", function(event) {
                
                paintColor(event.srcElement.style.backgroundColor);

            });

            if ( null == document.getElementById("div_paint"+i) ){

                parent.document.getElementById("div_paint").appendChild(div);

            }

        }
        paintAnimation();
    }

    //let paintCount = 0;

    let paintAnimation = () => {   
        
        if ( 10 == paintCount ) {
            document.getElementById("div_animation").style.transtion = "all 0.1s";
            if ( "head" == obj ) {

                document.getElementById("div_animation").style.top = "40%";
                document.getElementById("div_animation").style.left = "38%";
    
                document.getElementById("div_paint").style.top = "40%";
                document.getElementById("div_paint").style.left = "40%";
    
            } else if ( "planet" == obj ) {
    
                document.getElementById("div_animation").style.top = "50%";
                document.getElementById("div_animation").style.left = "40%";
    
                document.getElementById("div_paint").style.top = "50%";
                document.getElementById("div_paint").style.left = "42%";
                
            }

        } 
        else if ( 100 == paintCount ) {

            document.getElementById("div_paint1").style.width = "3px";
            document.getElementById("div_paint1").style.height = "3px";

            document.getElementById("div_paint1").style.left = "200px";
            document.getElementById("div_paint2").style.left = "200px";
            document.getElementById("div_paint3").style.left = "200px";
            document.getElementById("div_paint4").style.left = "200px";
            document.getElementById("div_paint5").style.left = "200px";
            document.getElementById("div_paint6").style.left = "200px";
            document.getElementById("div_paint7").style.left = "200px"; 

        } else if ( 120 == paintCount ) {

            document.getElementById("div_paint1").style.top = "-35px";
            document.getElementById("div_paint2").style.top = "-35px";
            document.getElementById("div_paint3").style.top = "-35px";
            document.getElementById("div_paint4").style.top = "-35px";
            document.getElementById("div_paint5").style.top = "-35px";
            document.getElementById("div_paint6").style.top = "-35px";
            document.getElementById("div_paint7").style.top = "-35px";

        } else if ( 125 == paintCount ) {
            
            document.getElementById("div_paint1").style.width = "20px";
            document.getElementById("div_paint1").style.borderRadius = "0px";

        } else if ( 130 == paintCount ) {

            document.getElementById("div_paint1").style.height = "20px";

        } else if ( 135 == paintCount ) {

            document.getElementById("div_paint2").style.top = "-5px";
            document.getElementById("div_paint2").style.width = "20px";
            document.getElementById("div_paint2").style.borderRadius = "0px";

        } else if ( 140 == paintCount ) {

            document.getElementById("div_paint2").style.height = "20px";

        } else if ( 145 == paintCount ) {

            document.getElementById("div_paint3").style.top = "25px";
            document.getElementById("div_paint3").style.width = "20px";
            document.getElementById("div_paint3").style.borderRadius = "0px";

        } else if ( 150 == paintCount ) {

            document.getElementById("div_paint3").style.height = "20px";

        } else if ( 155 == paintCount ) {

            document.getElementById("div_paint4").style.top = "55px";
            document.getElementById("div_paint4").style.width = "20px";
            document.getElementById("div_paint4").style.borderRadius = "0px";

        } else if ( 160 == paintCount ) {

            document.getElementById("div_paint4").style.height = "20px";

        } else if ( 165 == paintCount ) {

            document.getElementById("div_paint5").style.top = "85px";
            document.getElementById("div_paint5").style.width = "20px";
            document.getElementById("div_paint5").style.borderRadius = "0px";

        } else if ( 170 == paintCount ) {

            document.getElementById("div_paint5").style.height = "20px";

        } else if ( 175 == paintCount ) {

            document.getElementById("div_paint6").style.top = "115px";
            document.getElementById("div_paint6").style.width = "20px";
            document.getElementById("div_paint6").style.borderRadius = "0px";

        } else if ( 180 == paintCount ) {

            document.getElementById("div_paint6").style.height = "20px";

        } else if ( 185 == paintCount ) {

            document.getElementById("div_paint7").style.top = "145px";
            document.getElementById("div_paint7").style.width = "20px";
            document.getElementById("div_paint7").style.borderRadius = "0px";

        } else if ( 190 == paintCount ) {

            document.getElementById("div_paint7").style.height = "20px";

        } else if ( 200 == paintCount ) {

            document.getElementById("div_paint1").style.backgroundColor = "red";

        } else if ( 210 == paintCount ) {

            document.getElementById("div_paint2").style.backgroundColor = "orange";

        } else if ( 220 == paintCount ) {

            document.getElementById("div_paint3").style.backgroundColor = "yellow";

        } else if ( 230 == paintCount ) {

            document.getElementById("div_paint4").style.backgroundColor = "green";

        } else if ( 240 == paintCount ) {

            document.getElementById("div_paint5").style.backgroundColor = "#005fff";

        } else if ( 250 == paintCount ) {

            document.getElementById("div_paint6").style.backgroundColor = "indigo";

        } else if ( 260 == paintCount ) {

            document.getElementById("div_paint7").style.backgroundColor = "purple";
            
        } 

        paintCount += 1;

        if ( -1 == headPaintSwitch || -1 == planetPaintSwitch ) {

            requestAnimationFrame(paintAnimation);
        }
    }
    
    let paintColorM = "rgb(255, 192, 152)";

    let paintColor = (color) => {
        if ( "red" == color ) {
            paintColorM = "red";
        } else if ( "orange" == color ) {
            paintColorM = "orange";
        }  else if ( "yellow" == color ) {
            paintColorM = "yellow";
        }  else if ( "green" == color ) {
            paintColorM = "green";
        }  else if ( "rgb(0, 95, 255)" == color ) {
            paintColorM = "rgb(0, 95, 255)";
        }  else if ( "indigo" == color ) {
            paintColorM = "indigo";
        }  else if ( "purple" == color ) {
            paintColorM = "purple";
        }
        
        if ( "head" == obj ) {
            
            document.getElementById('div_head').style.background = "linear-gradient( to bottom, rgb(255,192,152) ,"+paintColorM+")";
        } else if ( "planet" == obj ) {

            document.getElementById('div_planet').style.background = "linear-gradient( to bottom, rgb(255,192,152) ,"+paintColorM+")";
        }

    }

    //let paintCloseCount = 0;

    let paintClose = () => {

        if ( 10 == paintCloseCount ) {
            
            document.getElementById("div_paint7").style.height = "0px";
            document.getElementById("div_paint7").style.width = "3px";
            document.getElementById("div_paint7").style.top = "0px";
            document.getElementById("div_paint7").style.left = "-25px";
            document.getElementById("div_paint7").style.borderRadius = "50px";
            document.getElementById("div_paint7").style.backgroundColor = "white";

        } else if ( 20 == paintCloseCount ) {
            
            document.getElementById("div_paint6").style.height = "0px";
            document.getElementById("div_paint6").style.width = "3px";
            document.getElementById("div_paint6").style.top = "0px";
            document.getElementById("div_paint6").style.left = "-25px";
            document.getElementById("div_paint6").style.borderRadius = "50px";
            document.getElementById("div_paint6").style.backgroundColor = "white";

        } else if ( 30 == paintCloseCount ) {
            
            document.getElementById("div_paint5").style.height = "0px";
            document.getElementById("div_paint5").style.width = "3px";
            document.getElementById("div_paint5").style.top = "0px";
            document.getElementById("div_paint5").style.left = "-25px";
            document.getElementById("div_paint5").style.borderRadius = "50px";
            document.getElementById("div_paint5").style.backgroundColor = "white";

        } else if ( 40 == paintCloseCount ) {
            
            document.getElementById("div_paint4").style.height = "0px";
            document.getElementById("div_paint4").style.width = "3px";
            document.getElementById("div_paint4").style.top = "0px";
            document.getElementById("div_paint4").style.left = "-25px";
            document.getElementById("div_paint4").style.borderRadius = "50px";
            document.getElementById("div_paint4").style.backgroundColor = "white";

        } else if ( 50 == paintCloseCount ) {
            
            document.getElementById("div_paint3").style.height = "0px";
            document.getElementById("div_paint3").style.width = "3px";
            document.getElementById("div_paint3").style.top = "0px";
            document.getElementById("div_paint3").style.left = "-25px";
            document.getElementById("div_paint3").style.borderRadius = "50px";
            document.getElementById("div_paint3").style.backgroundColor = "white";

        } else if ( 60 == paintCloseCount ) {
            
            document.getElementById("div_paint2").style.height = "0px";
            document.getElementById("div_paint2").style.width = "3px";
            document.getElementById("div_paint2").style.top = "0px";
            document.getElementById("div_paint2").style.left = "-25px";
            document.getElementById("div_paint2").style.borderRadius = "50px";
            document.getElementById("div_paint2").style.backgroundColor = "white";

        } else if ( 70 == paintCloseCount ) {
            
            document.getElementById("div_paint1").style.height = "0px";
            document.getElementById("div_paint1").style.width = "3px";
            document.getElementById("div_paint1").style.top = "0px";
            document.getElementById("div_paint1").style.left = "-25px";
            document.getElementById("div_paint1").style.borderRadius = "50px";
            document.getElementById("div_paint1").style.backgroundColor = "white";
            
        } else if ( 80 == paintCloseCount ) {
            createStepButton();
            if ( null != document.getElementById("div_stepButton") ) {
                document.getElementById("div_stepButton").style.background = "linear-gradient( to bottom ,rgb(255, 192, 152), "+paintColorM+")";
            }
        }

        paintCloseCount += (1*speed);

        if ( 1 == headPaintSwitch || 1 == planetPaintSwitch ) {
        
            requestAnimationFrame(paintClose);
        }
    }
    
    let createStepButton = () => {

        let div;
        div = parent.document.createElement("div");
        div.id = "div_stepButton";
        div.className = "div_stepButton";
        div.style.position = "absolute";
        div.style.width = "1px";
        div.style.height = "1px";
        div.style.top = "70%";
        div.style.left = "45.9%";
        div.innerHTML = " ";
        //div.style.backgroundColor = "white";
        div.style.background = "linear-gradient( to bottom ,rgb(255, 192, 152), "+paintColorM+")";
        div.style.transition = "all 2s";
        div.style.color = "white";

        div.addEventListener("click",function() {
            buttonEvent();
        });

        if ( null == document.getElementById("div_stepButton") ){
            
            parent.document.body.appendChild(div);
        }
        
        stepButtonAnimation();
    }

    let stepButtonCount = 0;

    let stepButtonAnimation = () => {

        if ( 10 == stepButtonCount ) {

            document.getElementById("div_stepButton").style.paddingTop = "4px";
            document.getElementById("div_stepButton").style.width = "80px";
            
        } else if ( 30 == stepButtonCount ) {

            document.getElementById("div_stepButton").style.height = "30px";

        } else if ( 50 == stepButtonCount ) {

            document.getElementById("div_stepButton").style.borderRadius = "10px";
            document.getElementById("div_stepButton").innerText = "next";
            document.getElementById("div_stepButton").style.fontWeight = "bold";
            document.getElementById("div_stepButton").style.textAlign = "center";
            document.getElementById("div_stepButton").style.cursor = "pointer";

        } 
        
        stepButtonCount += (1*speed);
        requestAnimationFrame(stepButtonAnimation);
        
    }

    let buttonEvent = () => {

        document.getElementById("div_head").style.left = "0px"; //100px
        document.getElementById("div_leftEyes").style.left = "19px"; //119
        document.getElementById("div_RightEyes").style.left = "31px"; //131
        document.getElementById("div_body").style.left = "8px"; //108
        document.getElementById("div_planet").style.left = "-40px"; //60

        document.getElementById("div_animation").style.left = "30%";
        
        document.getElementById("div_stepButton").style.width = "0px";
        document.getElementById("div_stepButton").style.height = "0px";
        document.getElementById("div_stepButton").innerText = "";

        createInput();

    }

    let createInput = () => {
        let div ;
        for ( let i = 1 ; i <= 4 ; i++ ) {
            div = parent.document.createElement("div");
            div.style.backgroundColor = "white";
            div.style.border = "2px white solid";
            div.style.width = "0.1px";
            div.style.height = "0.1px";
            div.style.position = "absolute";
            div.style.top = "100px";
            div.style.left = "100px";
            div.style.borderRadius = "50px";
            div.innerText = " ";
            div.style.transition = "all 3s";
        
            div.id = "div_copy"+i;

            if ( null == document.getElementById("div_copy"+i) ) {
                parent.document.body.appendChild(div);
            }
        }

        div_copy_animation();
    }

    let count2 = 0;

    let div_copy_animation = () => {
        
        if ( 10 == count2 ) {
            document.getElementById('div_animation').style.left = "38%";

            document.getElementById('div_copy1').style.left = "42%";
            document.getElementById('div_copy2').style.left = "42%";
            document.getElementById('div_copy3').style.left = "42%";
            document.getElementById('div_copy4').style.left = "42%";

        }
        else if ( 100 == count2 ) {
            
            document.getElementById('div_copy1').style.top = "30%";
            document.getElementById('div_copy1').style.left = "51%";//60
            document.getElementById('div_copy1').style.backgroundColor = "rgb(30,30,30)";
            
        }
        else if ( 130 == count2 ) {

            document.getElementById('div_copy2').style.top = "calc( 30% + 70px )";
            document.getElementById('div_copy2').style.left = "51%";//60
            document.getElementById('div_copy2').style.backgroundColor = "rgb(30,30,30)";

        }
        else if ( 160 == count2 ) {

            document.getElementById('div_copy3').style.top = "calc( 30% + 140px )";
            document.getElementById('div_copy3').style.left = "51%";//60
            document.getElementById('div_copy3').style.backgroundColor = "rgb(30,30,30)";

        }
        else if ( 190 == count2 ) {

            document.getElementById('div_copy4').style.top = "calc( 30% + 210px )";
            document.getElementById('div_copy4').style.left = "51%";//60
            document.getElementById('div_copy4').style.backgroundColor = "rgb(30,30,30)";

        }
        else if ( 300 == count2 ) {
            
            document.getElementById('div_copy1').style.width = 35+"px";
            document.getElementById('div_copy1').style.height = 37+"px";

        }
        else if ( 350 == count2 ) {
            
            document.getElementById('div_copy2').style.width = 35+"px";
            document.getElementById('div_copy2').style.height = 37+"px";

        }
        else if ( 370 == count2 ) {
            
            document.getElementById('div_copy3').style.width = 35+"px";
            document.getElementById('div_copy3').style.height = 37+"px";

        }
        else if ( 400 == count2 ) {
            
            document.getElementById('div_copy4').style.width = 35+"px";
            document.getElementById('div_copy4').style.height = 36+"px";

        } 
        else if ( 500 == count2 ) {
            
            document.getElementById('ipt_nm').style.display = "block";
            document.getElementById('div_copy1').style.display = "none";

        } 
        else if ( 520 == count2 ) {
            
            document.getElementById('ipt_pw').style.display = "block";
            document.getElementById('div_copy2').style.display = "none";

        }
        else if ( 530 == count2 ) {
            
            document.getElementById('ipt_em').style.display = "block";
            document.getElementById('div_copy3').style.display = "none";

        }
        else if ( 540 == count2 ) {
            
            document.getElementById('ipt_bt').style.display = "block";
            document.getElementById('div_copy4').style.display = "none";

        }
        else if ( 660 == count2 ) {

            document.getElementById("chapter8").style.left = "91px";
            animation_one();

        } else if ( 720 == count2 ) {

            document.getElementById("div_head").style.animationName = "headMove";
            document.getElementById("div_head").style.animationDuration = "2s";
            document.getElementById("div_head").style.animationIterationCount = "infinite";

            document.getElementById("div_body").style.animationName = "bodyMove";
            document.getElementById("div_body").style.animationDuration = "2s";
            document.getElementById("div_body").style.animationIterationCount = "infinite";
            
        }
        
        //60 40 boxshadow
        //join step4 에서 거대한 흰색 행성 위치를 오른쪽아래로 배치해보자.

        count2 += (1*speed);
        requestAnimationFrame(div_copy_animation);

    }

    let btCount = 0;

    let bt = () => {
        animation_one_switch = "off";
        
        if ( 0 == btCount ) {
        
            document.getElementById('div_animation').style.width = 2000+"px";
            document.getElementById('div_animation').style.height = 2000+"px";

            document.getElementById('div_animation').style.top = -20+"%";
            document.getElementById('div_animation').style.left = -20+"%";

        }
        else if ( 100 == btCount ) {
            
            document.getElementById("chapter1").style.backgroundColor = "rgb(30,30,30)";
            document.getElementById("chapter2").style.backgroundColor = "rgb(30,30,30)";
            document.getElementById("chapter3").style.backgroundColor = "rgb(30,30,30)";
            document.getElementById("chapter4").style.backgroundColor = "rgb(30,30,30)";
            document.getElementById("chapter5").style.backgroundColor = "rgb(30,30,30)";
            document.getElementById("chapter6").style.backgroundColor = "rgb(30,30,30)";
            document.getElementById("chapter7").style.backgroundColor = "rgb(30,30,30)";
            
            document.getElementById("chapter8").style.animationName = "boxShadowAnimationBlack";

        } else if ( 200 == btCount ) {

            document.getElementById("chapter8").style.backgroundColor = "white";
            document.getElementById("chapter8").style.left = "132px";

        } else if ( 250 == btCount ) {

            document.getElementById("ipt_nm").style.width = "130px"; //값을 넣어주지 않으면 0px로 다시 시작하게 된다.
            document.getElementById("ipt_pw").style.width = "130px";
            document.getElementById("ipt_em").style.width = "160px";
            document.getElementById("ipt_bt").style.width = "130px";
            
            document.getElementById("ipt_nm").style.animationName = "ipt_nm_remove";
            document.getElementById("ipt_pw").style.animationName = "ipt_pw_remove";
            document.getElementById("ipt_em").style.animationName = "ipt_em_remove";
            document.getElementById("ipt_bt").style.animationName = "ipt_bt_remove";

        } else if ( 450 == btCount ) {

            document.getElementById("div_content1").style.animationName = "";
            document.getElementById("div_content2").style.animationName = "";
            document.getElementById("div_content3").style.animationName = "";
            document.getElementById("div_content4").style.animationName = "";

            document.getElementById("div_content1").style.transition = "all 2s";
            document.getElementById("div_content2").style.transition = "all 2s";
            document.getElementById("div_content3").style.transition = "all 2s";
            document.getElementById("div_content4").style.transition = "all 2s";

            document.getElementById("div_content1").style.marginTop = "105px";
            document.getElementById("div_content2").style.marginTop = "105px";
            document.getElementById("div_content3").style.marginTop = "105px";
            document.getElementById("div_content4").style.marginTop = "105px";

        } else if ( 470 == btCount ) {

            createLand();

        } else if ( 570 == btCount ) {

            landAnimation();

        } else if ( 750 == btCount ) {

            document.getElementById("div_content1").style.marginTop = "380px";
            document.getElementById("div_content2").style.marginTop = "380px";
            document.getElementById("div_content3").style.marginTop = "380px";
            document.getElementById("div_content4").style.marginTop = "380px";

        }
        
        btCount += (1*speed);
        requestAnimationFrame(bt);
    }

    let createLand = () => {

        let div;
        div = parent.document.createElement("div");
        div.id = "div_land";
        div.style.position = "absolute";
        div.style.width = "0px";
        div.style.height = "50px";
        div.style.top = "92%";
        div.style.left = "50%";
        div.style.transition = "all 6s"; //7s
        div.style.backgroundColor = "rgb(30,30,30)";
        div.style.borderRadius = "30px";
        div.innerHTML = " ";

        //div.style.cursor = "pointer";

        //div.addEventListener("click",function () {

            //completeButton();

        //});

        if ( null == document.getElementById("div_land") ) {

            parent.document.body.appendChild(div);
        }

    }

    let landAnimationCount = 0;

    let landAnimation = () => {

        if ( 10 == landAnimationCount ) {

            document.getElementById("div_land").style.width = window.innerWidth+"px";
            document.getElementById("div_land").style.height = "50px";
            document.getElementById("div_land").style.top = "92%";
            landLeftAnimation();

        } else if ( 100 == landAnimationCount ) {
            
            document.getElementById("div_planet").style.animationName = "planetMove";
            document.getElementById("div_planet").style.animationDuration = "2s";
            document.getElementById("div_planet").style.animationIterationCount = "infinite";

        } else if ( 200 == landAnimationCount ) {

            createCanvas();

        } else if ( 500 == landAnimationCount ) {

            textAreaAnimation();

        }

        
        landAnimationCount += 1;
        requestAnimationFrame(landAnimation);

    }

    let landLeftCount = 50;

    let landLeftAnimation = () => { //확장시키기

        if ( 0 <= landLeftCount ) {
            document.getElementById("div_land").style.left = landLeftCount+"%";
            landLeftCount -= 5;
            if ( 0 == landLeftCount ) {
                document.getElementById("div_land").style.borderRadius = "0px";
            }
            requestAnimationFrame(landLeftAnimation);
        } 

    }

    let can;
    let con;


    let createCanvas = () => {
        //canvas create 할때 width 를 css 속성이 아닌걸로 해야한다. px는 빼고 해야함.
        let canvas = parent.document.createElement("canvas");
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
        canvas.style.position = "absolute";
        canvas.style.top = "-49px";
        canvas.style.left = "0px";
        canvas.id = "canvas";

        parent.document.body.appendChild(canvas);

        can = document.getElementById("canvas");
        con = can.getContext("2d");

        canvasAnimation();

    }

    //기둥
    let backX1 = window.innerWidth/2;
    let backY1 = window.innerHeight;
    let branchX1 = window.innerWidth/2;
    let branchY1 = window.innerHeight;

    // 가지1
    let backX2 = backX1;
    let backY2 = (backY1/2+backY1/4);
    let branchX2 = branchX1;
    let branchY2 = (backY1/2+backY1/4);
    // 가지1-1
    let backX3;
    let backY3;
    let branchX3;
    let branchY3;
    // 가지1-2
    let backX4;
    let backY4;
    let branchX4;
    let branchY4;

    // 가지2
    let backX5 = backX1;
    let backY5 = (backY1/2+backY1/6);
    let branchX5 = branchX1;
    let branchY5 = (backY1/2+backY1/6);
    // 가지2-1
    let backX6;
    let backY6;
    let branchX6;
    let branchY6;
    // 가지2-2
    let backX7;
    let backY7;
    let branchX7;
    let branchY7;

    let canvasAnimation = () => {

        //con.beginPath();
        con.clearRect(0,0,window.innerWidth,window.innerHeight); //라인이 픽셀로 깨지지 않고 부드러움
        con.strokeStyle = "rgb(30,30,30)";
        con.lineWidth = 0.1; //작아질수록 맨 앞이 얇아지면서 날카로워짐. beginPath() 랑 같이 쓰면 날카로워지는 현상 없어짐.
        
        if ( window.innerHeight/2 < backY1 ) {
            //나무 기둥 , 특정길이까지
            backY1 -= 1;
            con.moveTo(branchX1,branchY1);
            con.lineTo(branchX1,branchY1);
            con.lineTo(backX1,backY1);
            con.stroke();

        }
        
        if ( ((branchY2) > backY1) && (window.innerWidth/2-80) < backX2 ) {
            //어느시점 && 특정길이까지
            backX2 -= 1;
            backY2 -= 1;
            
            con.moveTo(branchX2,branchY2);
            con.lineTo(branchX2,branchY2);
            con.lineTo(backX2,backY2);
            con.stroke();

            if ( (window.innerWidth/2-40) == backX2 ) {
                backX3 = backX2;
                backY3 = backY2;

                branchX3 = backX2;
                branchY3 = backY2;
            }

            if ( (window.innerWidth/2-60) == backX2 ) {
                backX4 = backX2;
                backY4 = backY2;

                branchX4 = backX2;
                branchY4 = backY2;
            }

        }

        if ( ((window.innerWidth/2-40) > backX2) && ((backX3-30) < branchX3 )) {

            branchX3 -= 1;
            
            con.moveTo(backX3,backY3);
            con.lineTo(backX3,backY3);
            con.lineTo(branchX3,branchY3);
            con.stroke();

        }

        if ( ((window.innerWidth/2-60) > backX2) && ((backY4-20) < branchY4 )) {

            branchY4 -= 1;
            
            con.moveTo(backX4,backY4);
            con.lineTo(backX4,backY4);
            con.lineTo(branchX4,branchY4);
            con.stroke();

        }

        if ( ((branchY5) > backY1) && (window.innerWidth/2+60) > backX5 ) {
            //어느시점 && 특정길이까지
            backX5 += 1;
            backY5 -= 1;
            
            //con.moveTo(window.innerWidth/2,(window.innerHeight/2+window.innerHeight/6));
            //con.lineTo(window.innerWidth/2,(window.innerHeight/2+window.innerHeight/6));
            con.moveTo(branchX5,branchY5);
            con.lineTo(branchX5,branchY5);
            con.lineTo(backX5,backY5);
            con.stroke();

            if ( (window.innerWidth/2+20) == backX5 ) {
                backX6 = backX5;
                backY6 = backY5;

                branchX6 = backX5;
                branchY6 = backY5;
            }

            if ( (window.innerWidth/2+40) == backX5 ) {
                backX7 = backX5;
                backY7 = backY5;

                branchX7 = backX5;
                branchY7 = backY5;
            }

        }

        if ( ((window.innerWidth/2+20) < backX5) && ((backX6+30) > branchX6 )) {

            branchX6 += 1;
            
            con.moveTo(backX6,backY6);
            con.lineTo(backX6,backY6);
            con.lineTo(branchX6,branchY6);
            con.stroke();

        }

        if ( ((window.innerWidth/2+40) < backX5) && ((backY7-20) < branchY7 )) {

            branchY7 -= 1;
            
            con.moveTo(backX7,backY7);
            con.lineTo(backX7,backY7);
            con.lineTo(branchX7,branchY7);
            con.stroke();

        }
        

        con.stroke();

        requestAnimationFrame(canvasAnimation);

    }

    let textAreaAnimationCount = 0;

    let textAreaAnimation = () => {


        if ( 10 == textAreaAnimationCount ) {

            document.getElementById("div_textArea").style.display = "block";
    
        } else if ( 30 == textAreaAnimationCount ) {

            document.getElementById("div_textArea").style.zIndex = 5;
            document.getElementById("ta_diary").style.width = "249px";
            document.getElementById("ta_diary").style.height = "44px";
            document.getElementById("ta_diary").style.border = "1.5px rgb(30,30,30) solid";
            document.getElementById("ta_diary").style.resize = "none";
        } else if ( 100 == textAreaAnimationCount ) {

            document.getElementById("ipt_diary").style.width = "100px";
            document.getElementById("ipt_diary").value = "send";

        }

        textAreaAnimationCount += 1;

        requestAnimationFrame(textAreaAnimation);

    }


    let completeButton = () => {

        completeAnimation();

    }

    let completeAnimationCount = 0;

    let completeAnimation = () => {

        if ( 10 == completeAnimationCount ) {

            document.getElementById("ipt_diary").style.width = "0px";
            document.getElementById("ipt_diary").value = "";

            document.getElementById("ta_diary").style.width = "0px";
            document.getElementById("ta_diary").style.height = "0px";

        } else if ( 200 == completeAnimationCount ) {
            
            //document.getElementById("ta_diary").style.width = window.innerWidth+"px";
            //document.getElementById("ta_diary").style.height = window.innerHeight+"px";

            document.getElementById("ta_diary").style.top = "107px";
            document.getElementById("ta_diary").style.left = "187px";

            //document.getElementById("ta_diary").style.top = "0px";
            //document.getElementById("ta_diary").style.left = "0px";

        } else if ( 300 == completeAnimationCount ) {

            document.getElementById("ta_diary").style.display = "none";
            document.getElementById("ipt_diary").style.top = "380px";

        } else if ( 450 == completeAnimationCount ) {

            document.getElementById("div_textArea").style.display = "none";
            document.getElementById("div_container").style.display = "none";

            document.getElementById("div_animation").style.left = "40%";
            document.getElementById("div_animation").style.top = "50%";

            document.getElementById("div_land").style.width = 0+"px";

            landRightAnimation();

        } else if ( 550 == completeAnimationCount ) {

            document.getElementById("div_head").style.left = "100px"; // 0px
            document.getElementById("div_leftEyes").style.left = "119px"; // 19px
            document.getElementById("div_RightEyes").style.left = "131px"; // 31px
            document.getElementById("div_body").style.left = "108px"; // 8px
            document.getElementById("div_planet").style.left = "60px"; // -40px

        }

        completeAnimationCount += 1;

        requestAnimationFrame(completeAnimation);
    }

    let landRightAnimation = () => { //축소시키기
        
        if ( 100 >= landLeftCount ) {
            
            document.getElementById("div_land").style.left = landLeftCount+"%";
            landLeftCount += 5;
            
            requestAnimationFrame(landRightAnimation);
        } 
        
    }






    window.addEventListener ( "mousemove" , function (event) {

        

    });