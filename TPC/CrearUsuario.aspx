<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearUsuario.aspx.cs" Inherits="TPC.CrearUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    body {
        background-color: #0d1117;
        color: #e6edf3;
        margin: 0;
        height: 100vh;
        overflow: hidden;
    }

    .contenedor {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 40px 0;
    }

    .formulario {
        width: 90%;
        max-width: 500px;
        background-color: #161b22;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
    }

    .grosor {
        height: 50px;
    }
</style>

<script>
    function validar() {
        const txtUser = document.getElementById("<%= txtUser.ClientID %>");
        const exUser = /^[A-Za-z0-9]{4,20}$/;

        const txtPass = document.getElementById("<%= txtPass.ClientID %>");
        const exPass = /^.{6,20}$/;

        let valido = true;

        if (!exUser.test(txtUser.value.trim())) {
            txtUser.classList.add("is-invalid");
            valido = false;
        } else {
            txtUser.classList.remove("is-invalid");
        }

        if (!exPass.test(txtPass.value.trim())) {
            txtPass.classList.add("is-invalid");
            valido = false;
        } else {
            txtPass.classList.remove("is-invalid");
        }

        return valido;
    }
</script>

<div class="contenedor">
    <div class="formulario">
        <h3>Crear Usuario</h3>

        <br />

        <label for="txtUser" class="form-label">Usuario</label>
        <asp:TextBox runat="server" ID="txtUser" CssClass="form-control grosor" placeholder="Usuario" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUser" ErrorMessage="El usuario es obligatorio" CssClass="text-danger" Display="Dynamic" />

        <br />

        <label for="txtPass" class="form-label">Contraseña</label>
        <asp:TextBox runat="server" ID="txtPass" CssClass="form-control grosor" TextMode="Password" placeholder="Contraseña" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPass" ErrorMessage="La contraseña es obligatoria" CssClass="text-danger" Display="Dynamic" />

        <br /><br />

        <asp:Button Text="Agregar" ID="btnAgregar" runat="server" CssClass="btn btn-success" OnClientClick=" validar()"  OnClick="btnAgregar_Click"/>
        <asp:Button Text="Agregar Admin" ID="btnAgregarAdmin" runat="server" CssClass="btn btn-primary" OnClientClick=" validar()"  OnClick="btnAgregarAdmin_Click"/>
        <asp:Button Text="Volver" ID="btnCancelar" runat="server" CssClass="btn btn-danger" CausesValidation="false"  OnClick="btnCancelar_Click"/>
        <br />
        <br />
        <asp:Label ID="lblMensaje" CssClass="bg-success" runat="server" />
    </div>
    
</div>

</asp:Content>
