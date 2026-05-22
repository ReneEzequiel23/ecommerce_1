/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/*
document.getElementById("cambiarContrasena").addEventListener("change", () => {
    document.getElementById("cambiarContr").classList.toggle("show");
});
*/
const checkbox = document.getElementById("cambiarContrasena");
const camposContra = document.querySelectorAll(".cambiar-contra");

checkbox.addEventListener("change", function () {
    camposContra.forEach(div => {
        if (this.checked) {
            div.classList.remove("hidden");
        } else {
            div.classList.add("hidden");
        }
    });
});