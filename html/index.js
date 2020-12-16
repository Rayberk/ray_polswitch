$(function() {
    function display(bool) {
        if (bool) {
            document.getElementById("txt").innerHTML = "Active";
            ea("panel").style.display = "block";
            ea("trademark").style.display = "block";
            ea("containerssq").style.display = "block";
            light.style.display = "block";
            light1.style.display = "block";
        } else {
            document.getElementById("txt").innerHTML = "Disabled";           
            ea("panel").style.display = "none";
            ea("trademark").style.display = "none";
            ea("containerssq").style.display = "none";
            light.style.display = "none";
            light1.style.display = "none";
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
            var item = event.data;
            if (item.type === "ui") {
                if (item.status == true) {
                    display(true)
                } else {
                    display(false)
                }
            }
        })
        // if the person uses the escape key, it will exit the resource
    
    
})