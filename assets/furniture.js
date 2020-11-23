AOS.init({
    duration: 1200,
});

// All products tab
function openCity(evt, tabName) {
    var i, tabcontentt, tablinks;
  
    tabcontentt = document.getElementsByClassName("tabcontentt");
    for (i = 0; i < tabcontentt.length; i++) {
      tabcontentt[i].style.display = "none";
    }
  
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" sec2active", "");
    }
  
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " sec2active";
}
document.getElementById("defaultOpen").click();
