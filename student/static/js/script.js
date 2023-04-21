const navLeftName = document.getElementsByClassName("navLeftName");
const navLeftIcon = document.getElementsByClassName("navLeftIcon");
const dashBoard = document.getElementById("container");
function showHideLoggedInLeft() {
  for (
    let navLeftNumber = 0;
    navLeftNumber < navLeftName.length;
    navLeftNumber++
  ) {
    if (navLeftName[navLeftNumber].style.display != "none") {
      navLeftName[navLeftNumber].style.display = "none";
      navLeftIcon[navLeftNumber].style.width = "60px";
      dashBoard.style.width = "90%";
      dashBoard.style.marginLeft = "85px";
    } else {
      navLeftIcon[navLeftNumber].style.width = "60px";
      navLeftName[navLeftNumber].style.display = "flex";
      dashBoard.style.width = "80%";
      dashBoard.style.marginLeft = "300px";
    }
  }
}

