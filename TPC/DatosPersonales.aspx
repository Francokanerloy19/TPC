<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DatosPersonales.aspx.cs" Inherits="TPC.DatosPersonales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container mt-4">
    <div class="card shadow-lg border-light bg-dark text-white">
        <div class="card-header bg-secondary text-white text-center">
            <h3>Datos personales</h3>
        </div>

        <div class="card-body">
            <div class="row mb-3">
                <div class="col">
                    <label class="fw-bold">DNI:</label>
                     <asp:Label ID="lblDNI" runat="server"></asp:Label>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label class="fw-bold">Nombre:</label>
                     <asp:Label ID="lblNombre" runat="server"></asp:Label>
                </div>

                <div class="col">
                    <label class="fw-bold">Apellido:</label>
                    <asp:Label ID="lblApellido" runat="server"></asp:Label>
                </div>

                <div class="col">
                    <label class="fw-bold">Email:</label>
                   <asp:Label ID="lblCorreo" runat="server"></asp:Label>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label class="fw-bold">Barrio:</label>
                    <asp:Label ID="lblBarrio" runat="server"></asp:Label>
                </div>

                <div class="col">
                    <label class="fw-bold">Dirección:</label>
                   <asp:Label ID="lblDireccion" runat="server"></asp:Label>
                </div>

                <div class="col">
                    <label class="fw-bold">Celular:</label>
                    <asp:Label ID="lblTelefono" runat="server"></asp:Label>
                </div>
            </div>
        </div>

        <div class="card-footer text-center bg-dark border-light">
            <asp:Button Text="Volver" ID="btnVolver" runat="server" CssClass="btn btn-light" OnClick="btnVolver_Click" />
        </div>
    </div>
</div>


</asp:Content>
   