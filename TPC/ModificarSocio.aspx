<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarSocio.aspx.cs" Inherits="TPC.ModificarSocio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container mt-4">
     <div class="card shadow-lg border-primary">
         <div class="card-header bg-primary text-white text-center">
             <h3>Datos personales</h3>
         </div>

         <div class="card-body bg-light">
             <div class="row mb-3">
                 <div class="col">
                     <label for="txtDNI" class="form-label">DNI</label>
                     <asp:TextBox runat="server" ID="txtDNI" CssClass="form-control" placeholder="33445577" />
                 </div>
             </div>

             <div class="row mb-3">
                 <div class="col">
                     <label for="TextNombre" class="form-label">Nombre</label>
                     <asp:TextBox runat="server" ID="TextNombre" CssClass="form-control" placeholder="Nombre" />
                 </div>

                 <div class="col">
                     <label for="TxtApellido" class="form-label">Apellido</label>
                     <asp:TextBox runat="server" ID="TxtApellido" CssClass="form-control" placeholder="Apellido" />
                 </div>

                 <div class="col">
                     <label for="validationtxtEmail" class="form-label">Email</label>
                     <asp:TextBox runat="server" ID="validationtxtEmail" CssClass="form-control" placeholder="email@email.com" />
                 </div>
             </div>

             <div class="row mb-3">
                 <div class="col">
                     <label for="txtBarrio" class="form-label">Barrio</label>
                     <asp:TextBox runat="server" ID="txtBarrio" CssClass="form-control" placeholder="Barrio" />
                 </div>

                 <div class="col">
                     <label for="txtDireccion" class="form-label">Dirección</label>
                     <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" placeholder="Dirección" />
                 </div>

                 <div class="col">
                     <label for="txtCelular" class="form-label">Celular</label>
                     <asp:TextBox runat="server" ID="txtCelular" CssClass="form-control" placeholder="Celular" />
                 </div>
             </div>
         </div>

         <div class="card-footer text-center bg-white">
             <asp:Button Text="Agregar" ID="btnAgregar" runat="server" CssClass="btn btn-success mx-2" />
             <asp:Button Text="Cancelar" ID="btnCancelar" runat="server" CssClass="btn btn-danger mx-2"  OnClick="btnCancelar_Click"/>
         </div>
     </div>
 </div>
</asp:Content>
