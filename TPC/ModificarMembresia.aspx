<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarMembresia.aspx.cs" Inherits="TPC.ModificarMembresia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script>   
     function validar() {
         const txtDireccion = document.getElementById("<%=txtDireccion.ClientID%>");
         const exRegularDireccion = /^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s.,-]{2,100}$/;
         const txtBarrio = document.getElementById("<%=txtBarrio.ClientID%>");
         const exRegularBarrio = /^[A-Za-zÁÉÍÓÚáéíóúÑñ]{4,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$/;
         const txtCelular = document.getElementById("<%=txtCelular.ClientID%>");
         const exRegularCelular =  const txtCelular = document.getElementById("<%=txtCelular.ClientID%>");
         const exRegularCelular = /^(?:(?:\+54)?(?:9)?)(?:11|[2368]\d)(?:\d{6,8})$/;



         let valido = true;
         if (!exRegularDireccion.test(txtDireccion.value.trim())) {
             txtDireccion.classList.add("is-invalid");
             txtDireccion.classList.remove("is-valid");
             valido = false;
         } else {
             txtDireccion.classList.remove("is-invalid");
             txtDireccion.classList.add("is-valid");

         }
         if (!exRegularCiudad.test(txtBarrio.value.trim())) {
             txtBarrio.classList.add("is-invalid");
             txtBarrio.classList.remove("is-valid");
             valido = false;
         } else {
             txtBarrio.classList.remove("is-invalid");
             txtBarrio.classList.add("is-valid");

         }
         if (!exRegularCP.test(txtCelular.value.trim())) {
             txtCelular.classList.add("is-invalid");
             txtCelular.classList.remove("is-valid");
             valido = false;
         } else {
             txtCelular.classList.remove("is-invalid");
             txtCelular.classList.add("is-valid");

         }



         return valido;


     }


     </script>

 <div class="container mt-4 bg-dark text-white">
     <div class="card shadow-lg border-primary bg-dark text-white">
         <div class="card-header bg-primary text-white text-center">
             <h3>Datos personales</h3>
         </div>

         <div class="card-body bg-dark text-white">
             <div class="row mb-3">
                 <div class="col">
                     <label for="txtBarrio" class="form-label">Barrio</label>
                     <asp:TextBox runat="server" ID="txtBarrio" CssClass="form-control" />
                     <asp:RequiredFieldValidator ID="rfvtxtBarrio" runat="server" ControlToValidate="txtBarrio" ErrorMessage="El barrio es obligatorio" CssClass="text-danger" Display="Dynamic" />
                     <asp:RegularExpressionValidator ID="revtxtBarrio" runat="server" ControlToValidate="txtBarrio" ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s.,-]{2,100}$" ErrorMessage="Ingrese un barrio válido" Display="Dynamic" />
                 </div>

                 <div class="col">
                     <label for="txtDireccion" class="form-label">Dirección</label>
                     <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" />
                     <asp:RequiredFieldValidator ID="rfvtxtDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="La direccion es obligatoria" CssClass="text-danger" Display="Dynamic" />
                     <asp:RegularExpressionValidator ID="revtxtDireccion" runat="server" ControlToValidate="txtDireccion" ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s.,-]{2,100}$" ErrorMessage="Ingrese una dirección válida" Display="Dynamic" />
                 </div>

                 <div class="col">
                     <label for="txtCelular" class="form-label">Celular</label>
                     <asp:TextBox runat="server" ID="txtCelular" CssClass="form-control" />
                     <asp:RequiredFieldValidator ID="rfvtxtCelular" runat="server" ControlToValidate="txtCelular" ErrorMessage="El numero es obligatorio" CssClass="text-danger" Display="Dynamic" />
                     <asp:RegularExpressionValidator ID="revtxtCelular" runat="server" ControlToValidate="txtCelular" ValidationExpression="^(?:\+54)?9?(?:11|[2368]\d)\d{6,8}$" ErrorMessage="Ingrese un celular valido" Display="Dynamic" />
                 </div>
             </div>
         </div>

         <div class="card-footer text-center bg-dark">
             <asp:Button Text="Agregar" ID="btnModificar" runat="server" CssClass="btn btn-success mx-2" OnClientClick="return validar()"  />
             <asp:Button Text="Cancelar" ID="btnCancelar" runat="server" CssClass="btn btn-danger mx-2"  CausesValidation="false" />
         </div>
     </div>
 </div>
</asp:Content>
