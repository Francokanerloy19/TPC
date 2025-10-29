<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevoSocio.aspx.cs" Inherits="TPC.NuevoSocio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #0d1117;
            color: #e6edf3;
            margin: 0; /* 🔹 elimina márgenes que causan scroll */
            height: 100vh; /* 🔹 asegura ocupar la pantalla */
            overflow: hidden; /* 🔹 evita el scroll */
        }

        .campo-largo {
            width: 100% !important;
            max-width: 300% !important;
        }

        .grosor {
            height: 50px; /* 🔹 aumenta la altura (grosor) del campo */
        }

        .contenedor {
            display: flex;
            justify-content: center; /* centra horizontalmente */
            align-items: center; /* centra verticalmente */
            min-height: calc(100vh - 150px); /* 🔹 deja espacio para header+footer */
            padding: 40px 0;
        }

        .formulario {
            width: 90%; /* 🔹 Hace que use el 90% del espacio disponible */
            max-width: 1300px; /* 🔹 Aumentá este valor si querés más ancho */
            min-height: 500px; /* 🔹 aumenta la altura del bloque */
            background-color: #161b22;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
        }
    </style>
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

    <div class="contenedor">
        <div class="formulario">
            <!-- TODO tu contenido actual va acá -->

            <div class="row">
                <h3>Ingresá los datos</h3>
                <div class="col mb-3">
                    <br />
                    <label for="txtDNI" class="form-label">DNI</label>
                    <asp:TextBox runat="server" ID="txtDNI" CssClass="form-control grosor" placeholder="33445577" />
                    <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="El DNI es obligatorio" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ValidationExpression="^\d{7,8}$" ErrorMessage="El DNI debe tener entre 7 y 8 dígitos" CssClass="text-danger" Display="Dynamic" />
                </div>
            </div>

            <div class="row">

                <div class="col mb-0">
                    <br />
                    <label for="TextNombre" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="TextNombre" CssClass="form-control grosor" placeholder="Nombre" />
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="TextNombre" ErrorMessage="El nombre es obligatorio" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="TextNombre" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ]{2,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$" ErrorMessage="El nombre solo puede contener letras y espacios (mínimo 2 caracteres)" Display="Dynamic" />

                </div>

                <div class="col mb-0">
                    <br />
                    <label for="TxtApellido" class="form-label">Apellido</label>
                    <asp:TextBox runat="server" ID="TxtApellido" CssClass="form-control grosor" placeholder="Apellido" />
                    <asp:RequiredFieldValidator ID="refTxtApellido" runat="server" ControlToValidate="TxtApellido" ErrorMessage="El apellido es obligatorio" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revTxtApellido" runat="server" ControlToValidate="TxtApellido" ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ]{2,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$" ErrorMessage="El apellido solo puede contener letras y espacios (mínimo 2 caracteres)" Display="Dynamic" />

                </div>

                <div class="col mb-0">
                    <br />
                    <label for="validationtxtEmail" class="form-label">Email</label>
                    <div class="input-group">
                        <span class="input-group-text" id="txtEmails">@</span>
                        <asp:TextBox runat="server" ID="validationtxtEmail" CssClass="form-control grosor" placeholder="email@email.com" aria-describedby="txtEmails" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvValidationtxtEmail" runat="server" ControlToValidate="validationtxtEmail" ErrorMessage="El email es obligatorio" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revValidationtxtEmail" runat="server" ControlToValidate="validationtxtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Ingrese un email válido" Display="Dynamic" />


                </div>
            </div>

            <div class="row">

                <div class="col">
                    <br />
                    <label for="txtBarrio" class="form-label">Barrio</label>
                    <asp:TextBox runat="server" ID="txtBarrio" CssClass="form-control campo-largo grosor" placeholder="Barrio" />
                    <asp:RequiredFieldValidator ID="rfvtxtBarrio" runat="server" ControlToValidate="txtBarrio" ErrorMessage="El barrio es obligatorio" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revtxtBarrio" runat="server" ControlToValidate="txtBarrio" ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s.,-]{2,100}$" ErrorMessage="Ingrese un barrio válido" Display="Dynamic" />

                </div>

                <div class="col mb-0">
                    <br />
                    <label for="txtDireccion" class="form-label">Dirección</label>
                    <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control grosor" placeholder="Dirreción" />
                    <asp:RequiredFieldValidator ID="rfvtxtDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="La direccion es obligatoria" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revtxtDireccion" runat="server" ControlToValidate="txtDireccion" ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s.,-]{2,100}$" ErrorMessage="Ingrese una dirección válida" Display="Dynamic" />

                </div>

                <div class="col mb-0">
                    <br />
                    <label for="txtCelular" class="form-label">Celular</label>
                    <asp:TextBox runat="server" ID="txtCelular" CssClass="form-control grosor" placeholder="xxxx" />
                    <asp:RequiredFieldValidator ID="rfvtxtCelular" runat="server" ControlToValidate="txtCelular" ErrorMessage="El numero es obligatorio" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revtxtCelular" runat="server" ControlToValidate="txtCelular" ValidationExpression="/^(?:(?:\+54)?(?:9)?)(?:11|[2368]\d)(?:\d{6,8})$/" ErrorMessage="Ingrese un celular valido" Display="Dynamic" />

                </div>
            </div>

            <br />
            <div class="col-12">

                <asp:Button Text="Agregar" ID="btnAgregar" runat="server" class="btn btn-primary" OnClientClick="return validar()" />
            </div>
        </div>
    </div>
</asp:Content>
