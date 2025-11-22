<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TPC.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <columns>
     <br />
     <br />
     <br />
     <br />
     <br />
     <div class="container mt-4">
         <div class="card shadow-lg border-success">
             <div class="card-header bg-success text-white text-center">
                 <h4>Panel de administracion</h4>
             </div>
             <div class="card-body bg-dark text-light">
                 <br />
                 <div class="d-flex justify-content-center gap-3">
                     <asp:Button ID="btnCrearUsuario" runat="server" Text="Crear usuario" CssClass="btn btn-outline-light btn-lg" OnClick="btnCrearUsuario_Click"/>
                     <asp:Button ID="btnModificarPlan" runat="server" Text="Modificar plan" CssClass="btn btn-outline-warning btn-lg" OnClick="btnModificarPlan_Click"/>
                     <asp:Button ID="btnEliminarPlan" runat="server" Text="Eliminar plan" CssClass="btn btn-outline-danger btn-lg" OnClick="btnEliminarPlan_Click"/>
                     <asp:Button ID="btnAgregarPlan" runat="server" Text="Agregar plan" CssClass="btn btn-outline-success btn-lg" OnClick="btnAgregarPlan_Click"/>
                 </div>
             </div>
             <div class="card-footer bg-dark text-white text-center text-muted small">
                 Panel de administración
             </div>
         </div>
     </div>

     
     <br />
      <asp:Button ID="btnVolverMenu"  Text="Volver al menu" runat="server"  CssClass="btn btn-outline-danger btn-lg" OnClick="btnVolverMenu_Click"/>
     
 </columns>
</asp:Content>
