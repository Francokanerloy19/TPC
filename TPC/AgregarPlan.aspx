<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarPlan.aspx.cs" Inherits="TPC.AgregarPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            background-color: #0d1117;
            color: #e6edf3;
            margin: 0;
            height: 100vh;
        }

        .centrar-vertical {
            min-height: 400px;
            display: flex;
            align-items: center; /* centra verticalmente */
            justify-content: center; /* centra horizontalmente */
        }

        .card {
            width: 800px; /* ancho de la tarjeta */
            max-width: 95%; /* que nunca se rompa en pantallas chicas */
        }

        .form-group {
            margin-bottom: 15px;
        }
    </style>
    <script>
        function validar() {
            const txtNombre = document.getElementById("<%=TextNombre.ClientID%>");
        const txtDuracion = document.getElementById("<%=TxtDuracionDias.ClientID%>");
        const txtPrecio = document.getElementById("<%=txtPrecio.ClientID%>");

        // --- Expresiones Regulares ---
        const exNombre = /^[A-Za-zÁÉÍÓÚáéíóúÑñ]{2,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$/;
        const exDuracion = /^(0?[1-9]|[12][0-9]|3[01])$/; 
        const exPrecio = /^[0-9]+(\.[0-9]{1,2})?$/;

        let valido = true;

        // Validar Nombre
        if (!exNombre.test(txtNombre.value.trim())) {
            txtNombre.classList.add("is-invalid");
            txtNombre.classList.remove("is-valid");
            valido = false;
        } else {
            txtNombre.classList.remove("is-invalid");
            txtNombre.classList.add("is-valid");
        }

        // Validar Duración
        if (!exDuracion.test(txtDuracion.value.trim())) {
            txtDuracion.classList.add("is-invalid");
            txtDuracion.classList.remove("is-valid");
            valido = false;
        } else {
            txtDuracion.classList.remove("is-invalid");
            txtDuracion.classList.add("is-valid");
        }

        // Validar Precio
        if (!exPrecio.test(txtPrecio.value.trim())) {
            txtPrecio.classList.add("is-invalid");
            txtPrecio.classList.remove("is-valid");
            valido = false;
        } else {
            txtPrecio.classList.remove("is-invalid");
            txtPrecio.classList.add("is-valid");
        }

        return valido;
    }


    function validaraActividad() {
        const txtNombreActividad = document.getElementById("<%=TextNombreActividad.ClientID%>");
        const txtPrecioActividad = document.getElementById("<%=TxtPrecioActividad.ClientID%>");
        const txtDescripcion = document.getElementById("<%=TxtDescripcion.ClientID%>");

            // --- Expresiones Regulares ---
            const exNombre = /^[A-Za-zÁÉÍÓÚáéíóúÑñ]{2,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$/;
            const exPrecio = /^[0-9]+(\.[0-9]{1,2})?$/;
            const exDescripcion = /^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 .,;:¡!¿?]{3,}$/;

            let valido = true;

            // Validar Nombre Actividad
            if (!exNombre.test(txtNombreActividad.value.trim())) {
                txtNombreActividad.classList.add("is-invalid");
                txtNombreActividad.classList.remove("is-valid");
                valido = false;
            } else {
                txtNombreActividad.classList.remove("is-invalid");
                txtNombreActividad.classList.add("is-valid");
            }

            // Validar Precio Actividad
            if (!exPrecio.test(txtPrecioActividad.value.trim())) {
                txtPrecioActividad.classList.add("is-invalid");
                txtPrecioActividad.classList.remove("is-valid");
                valido = false;
            } else {
                txtPrecioActividad.classList.remove("is-invalid");
                txtPrecioActividad.classList.add("is-valid");
            }

            // Validar Descripción
            if (!exDescripcion.test(txtDescripcion.value.trim())) {
                txtDescripcion.classList.add("is-invalid");
                txtDescripcion.classList.remove("is-valid");
                valido = false;
            } else {
                txtDescripcion.classList.remove("is-invalid");
                txtDescripcion.classList.add("is-valid");
            }

            return valido;
        }
    </script>

    <div class="centrar-vertical">
    <div class="card shadow-lg border-success">
        <div class="card-header bg-success text-white text-center">
            <h2>Agregar membresía</h2>
        </div>

        <div class="card-body bg-dark text-light">
            <div class="row">

                <!-- Nombre -->
                <div class="col-4 form-group">
                    <label for="TextNombre" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="TextNombre" CssClass="form-control grosor" placeholder="Nombre" ValidationGroup="Membresia" />

                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                        ControlToValidate="TextNombre"
                        ErrorMessage="El nombre es obligatorio"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Membresia" />

                    <asp:RegularExpressionValidator ID="revNombre" runat="server"
                        ControlToValidate="TextNombre"
                        ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ]{2,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$"
                        ErrorMessage="El nombre debe contener solo letras y tener al menos 2 caracteres"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Membresia" />
                </div>

                <!-- Duración -->
                <div class="col-4 form-group">
                    <label for="TxtDuracionDias" class="form-label">Duración en días</label>
                    <asp:TextBox runat="server" ID="TxtDuracionDias" CssClass="form-control grosor" placeholder="30" ValidationGroup="Membresia" />

                    <asp:RequiredFieldValidator ID="rfvDuracion" runat="server"
                        ControlToValidate="TxtDuracionDias"
                        ErrorMessage="La duración es obligatoria"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Membresia" />

                    <asp:RegularExpressionValidator ID="revDuracion" runat="server"
                        ControlToValidate="TxtDuracionDias"
                        ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])$"
                        ErrorMessage="La duración debe ser un número entre 1 y 31"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Membresia" />
                </div>

                <!-- Precio -->
                <div class="col-4 form-group">
                    <label for="txtPrecio" class="form-label">Precio $</label>
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control grosor" placeholder="0.00" ValidationGroup="Membresia" />

                    <asp:RequiredFieldValidator ID="rfvPrecio" runat="server"
                        ControlToValidate="txtPrecio"
                        ErrorMessage="El precio es obligatorio"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Membresia" />

                    <asp:RegularExpressionValidator ID="revPrecio" runat="server"
                        ControlToValidate="txtPrecio"
                        ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$"
                        ErrorMessage="El precio debe ser un número válido con hasta 2 decimales"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Membresia" />
                </div>

                <!-- Botones -->
                <div class="col-12 mt-3 text-center">
                    <asp:Button Text="Agregar" ID="btnAgregarMembresia" runat="server"
                        CssClass="btn btn-success me-2"
                        ValidationGroup="Membresia"
                        OnClientClick="return validar()"
                        OnClick="btnAgregarMembresia_Click" />

                    <asp:Button Text="Cancelar" ID="btnCancelarMembresia" runat="server"
                        CssClass="btn btn-danger"
                        CausesValidation="false" />
                </div>

            </div>
        </div>
    </div>
</div>


<!-- AGREGAR ACTIVIDAD -->
<div class="centrar-vertical">
    <div class="card shadow-lg border-warning">
        <div class="card-header bg-warning text-white text-center">
            <h2>Agregar actividad</h2>
        </div>

        <div class="card-body bg-dark text-light">
            <div class="row">

                <!-- Nombre Actividad -->
                <div class="col-4 form-group">
                    <label for="TextNombreActividad" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="TextNombreActividad" CssClass="form-control grosor" placeholder="Nombre" ValidationGroup="Actividad" />

                    <asp:RequiredFieldValidator ID="rfvNombreAct" runat="server"
                        ControlToValidate="TextNombreActividad"
                        ErrorMessage="El nombre es obligatorio"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Actividad" />

                    <asp:RegularExpressionValidator ID="revNombreAct" runat="server"
                        ControlToValidate="TextNombreActividad"
                        ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ]{2,}(?: [A-Za-zÁÉÍÓÚáéíóúÑñ]+)*$"
                        ErrorMessage="El nombre debe contener solo letras y tener al menos 2 caracteres"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Actividad" />
                </div>

                <!-- Precio Actividad -->
                <div class="col-4 form-group">
                    <label for="TxtPrecioActividad" class="form-label">Precio $</label>
                    <asp:TextBox runat="server" ID="TxtPrecioActividad" CssClass="form-control grosor" placeholder="0.00" ValidationGroup="Actividad" />

                    <asp:RequiredFieldValidator ID="rfvPrecioAct" runat="server"
                        ControlToValidate="TxtPrecioActividad"
                        ErrorMessage="El precio es obligatorio"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Actividad" />

                    <asp:RegularExpressionValidator ID="revPrecioAct" runat="server"
                        ControlToValidate="TxtPrecioActividad"
                        ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$"
                        ErrorMessage="El precio debe ser un número válido con hasta 2 decimales"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Actividad" />
                </div>

                <!-- Descripción -->
                <div class="col-4 form-group">
                    <label for="TxtDescripcion" class="form-label">Descripción</label>
                    <asp:TextBox runat="server" ID="TxtDescripcion" CssClass="form-control grosor" placeholder="Clase..." ValidationGroup="Actividad" />

                    <asp:RequiredFieldValidator ID="rfvDesc" runat="server"
                        ControlToValidate="TxtDescripcion"
                        ErrorMessage="La descripción es obligatoria"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Actividad" />

                    <asp:RegularExpressionValidator ID="revDesc" runat="server"
                        ControlToValidate="TxtDescripcion"
                        ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 .,;:¡!¿?]{3,}$"
                        ErrorMessage="La descripción debe tener al menos 3 caracteres válidos"
                        CssClass="text-danger" Display="Dynamic"
                        ValidationGroup="Actividad" />
                </div>

                <!-- Botones -->
                <div class="col-12 mt-3 text-center">
                    <asp:Button Text="Agregar" ID="btnAgregarActividad" runat="server"
                        CssClass="btn btn-success me-2"
                        ValidationGroup="Actividad"
                        OnClientClick="if (!validaraActividad()) return false;"
                        OnClick="btnAgregarActividad_Click" />

                    <asp:Button Text="Cancelar" ID="btnCancelarActividad" runat="server"
                        CssClass="btn btn-danger"
                        CausesValidation="false" />
                </div>

            </div>
        </div>
    </div>
</div>




</asp:Content>
