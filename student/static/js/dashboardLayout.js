function toggleSideBar() {
    let sidebar = document.querySelector('aside');
    let mainContainer = document.querySelector("#mainContainer");
    let hamburger = document.querySelector('.hamburger');
    let margin = parseFloat(window.getComputedStyle(container, null).getPropertyValue("margin-left"));
    let lines = document.querySelectorAll(".hamburger div");
    let addToLeft = 200 - margin;
    if (window.innerHeight <= 550) {
        if (sidebar.style.top == 0 + "px") {
            sidebar.style.top = -700 + 'px';
            mainContainer.style.marginTop = 0 + 'px';
            lines[0].classList.remove('active1');
            lines[1].classList.remove("hidden");
            lines[2].classList.remove("active2");
        } else {
            sidebar.style.top = 0 + 'px';
            mainContainer.style.marginTop = 620 + 'px';
            lines[0].classList.add('active1');
            lines[1].classList.add("hidden");
            lines[2].classList.add("active2");
        }

    } else {
        if (sidebar.style.right == 0 + 'px') {
            sidebar.style.right = -350 + 'px';
            hamburger.style.right = 20 + 'px';
            if (mainContainer.style.position != 'relative')
                mainContainer.style.right = 0 + 'px';
            else
                mainContainer.style.marginRight = 0 + 'px';
            lines[0].classList.remove('active1');
            lines[1].classList.remove("hidden");
            lines[2].classList.remove("active2");
        }
        else {
            sidebar.style.right = 0 + 'px';
            hamburger.style.right = (addToLeft + 50) + 'px';
            if (mainContainer.style.position != 'relative')
                mainContainer.style.right = 200 + 'px';
            else
                mainContainer.style.marginRight = 200 + 'px';
            lines[0].classList.add('active1');
            lines[1].classList.add("hidden");
            lines[2].classList.add("active2");
        }
    }
}