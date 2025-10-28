<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <div class="d-flex justify-content-center align-items-center"  style="min-height: 75vh; overflow:auto;">
    <div class="container text-center">
        <div class="row justify-content-center">
            <div class="col-md-6 col-sm-10 bg-dark text-light p-4 rounded">
                <h3>Iniciar sesión</h3>

                <div class="mb-3">
                    <label for="Correo" class="form-label">Email</label>
                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control w-75 mx-auto" Placeholder="name@example.com" />
                </div>

                <div class="mb-3">
                    <label for="contraseña" class="form-label">Password</label>
                    <asp:TextBox ID="txtContrasenia" runat="server" CssClass="form-control w-75 mx-auto" TextMode="Password" />
                </div>

                <div>



                    <asp:Button ID="BtnConfirmar" runat="server" Text="Confirmar" CssClass="btn btn-primary mb-3" OnClick="BtnConfirmar_Click" />

                </div>
            </div>
        </div>
    </div>
        </div>
</asp:Content>