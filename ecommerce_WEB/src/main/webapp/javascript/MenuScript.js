/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.getElementById("toggleSidebar").addEventListener("click", () => {
    document.getElementById("sidebar").classList.toggle("hidden");
});

// Toggle perfil
document.getElementById("profilePic").addEventListener("click", () => {
    document.getElementById("profileMenu").classList.toggle("show");
});

