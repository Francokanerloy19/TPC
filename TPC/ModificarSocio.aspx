<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarSocio.aspx.cs" Inherits="TPC.ModificarSocio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>   
        function validar() {
            const txtDNI = document.getElementById("<%= txtDNI.ClientID %>");
            const exRegularDNI = /^\d{7,8}$/;
            const txtNombre = document.getElementById("<%=TextNombre.ClientID%>");
            const exRegularNombre = /^[A-Za-zÁÉÍÓÚáéíóúÑñ]{2,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$/;
            const txtApellido = document.getElementById("<%=TxtApellido.ClientID%>");
            const exRegularApellido = /^[A-Za-zÁÉÍÓÚáéíóúÑñ]{2,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$/;
            const txtEmail = document.getElementById("<%=validationtxtEmail.ClientID%>");
            const exRegularEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            const txtDireccion = document.getElementById("<%=txtDireccion.ClientID%>");
            const exRegularDireccion = /^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s.,-]{2,100}$/;
            const txtBarrio = document.getElementById("<%=txtBarrio.ClientID%>");
            const exRegularBarrio = /^[A-Za-zÁÉÍÓÚáéíóúÑñ]{4,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$/;
            const txtCelular = document.getElementById("<%=txtCelular.ClientID%>");
            const exRegularCelular = /^(?:(?:\+54)?(?:9)?)(?:11|[2368]\d)(?:\d{6,8})$/;



            let valido = true;

            if (!exRegularDNI.test(txtDNI.value.trim())) {
                txtDNI.classList.add("is-invalid");
                txtDNI.classList.remove("is-valid");
                valido = false;
            } else {
                txtDNI.classList.remove("is-invalid");
                txtDNI.classList.add("is-valid");

            }
            if (!exRegularNombre.test(txtNombre.value.trim())) {
                txtNombre.classList.add("is-invalid");
                txtNombre.classList.remove("is-valid");
                valido = false;
            } else {
                txtNombre.classList.remove("is-invalid");
                txtNombre.classList.add("is-valid");

            }
            if (!exRegularApellido.test(txtApellido.value.trim())) {
                txtApellido.classList.add("is-invalid");
                txtApellido.classList.remove("is-valid");
                valido = false;
            } else {
                txtApellido.classList.remove("is-invalid");
                txtApellido.classList.add("is-valid");

            }
            if (!exRegularEmail.test(txtEmail.value.trim())) {
                txtEmail.classList.add("is-invalid");
                txtEmail.classList.remove("is-valid");
                valido = false;
            } else {
                txtEmail.classList.remove("is-invalid");
                txtEmail.classList.add("is-valid");

            }
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

    <div class="container mt-4">
        <div class="card shadow-lg border-primary">
            <div class="card-header bg-primary text-white text-center">
                <h3>Datos personales</h3>
            </div>

            <div class="card-body bg-light">
                <div class="row mb-3">
                    <div class="col">
                        <label for="txtDNI" class="form-label">DNI</label>
                        <asp:TextBox runat="server" ID="txtDNI" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="El DNI es obligatorio" CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ValidationExpression="^\d{7,8}$" ErrorMessage="El DNI debe tener entre 7 y 8 dígitos" CssClass="text-danger" Display="Dynamic" />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <label for="TextNombre" class="form-label">Nombre</label>
                        <asp:TextBox runat="server" ID="TextNombre" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="TextNombre" ErrorMessage="El nombre es obligatorio" CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="TextNombre" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ]{2,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$" ErrorMessage="El nombre solo puede contener letras y espacios (mínimo 2 caracteres)" Display="Dynamic" />
                    </div>

                    <div class="col">
                        <label for="TxtApellido" class="form-label">Apellido</label>
                        <asp:TextBox runat="server" ID="TxtApellido" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="refTxtApellido" runat="server" ControlToValidate="TxtApellido" ErrorMessage="El apellido es obligatorio" CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revTxtApellido" runat="server" ControlToValidate="TxtApellido" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ]{2,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$" ErrorMessage="El apellido solo puede contener letras y espacios (mínimo 2 caracteres)" Display="Dynamic" />
                    </div>

                    <div class="col">
                        <label for="validationtxtEmail" class="form-label">Email</label>
                        <asp:TextBox runat="server" ID="validationtxtEmail" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvValidationtxtEmail" runat="server" ControlToValidate="validationtxtEmail" ErrorMessage="El email es obligatorio" CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revValidationtxtEmail" runat="server" ControlToValidate="validationtxtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Ingrese un email válido" Display="Dynamic" />
                    </div>
                </div>

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
                        <asp:RegularExpressionValidator ID="revtxtCelular" runat="server" ControlToValidate="txtCelular" ValidationExpression="/^(?:(?:\+54)?(?:9)?)(?:11|[2368]\d)(?:\d{6,8})$/" ErrorMessage="Ingrese un celular valido" Display="Dynamic" />
                    </div>
                </div>
            </div>

            <div class="card-footer text-center bg-white">
                <asp:Button Text="Agregar" ID="btnAgregar" runat="server" CssClass="btn btn-success mx-2" OnClientClick="return validar()" />
                <asp:Button Text="Cancelar" ID="btnCancelar" runat="server" CssClass="btn btn-danger mx-2" OnClick="btnCancelar_Click" CausesValidation="false" />
            </div>
        </div>
    </div>
</asp:Content>









