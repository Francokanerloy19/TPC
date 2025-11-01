<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestion.aspx.cs" Inherits="TPC.Gestion" %>

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
                    <h4>Gestión del Socio</h4>
                </div>
                <div class="card-body bg-dark text-light">
                    <p class="text-center mb-4">Seleccioná una acción para administrar al socio.</p>

                    <div class="d-flex justify-content-center gap-3">
                        <asp:Button ID="btnVerHistorial" runat="server" Text="Datos personales" CssClass="btn btn-outline-light btn-lg" />
                        <asp:Button ID="btnPagar" runat="server" Text="modificar" CssClass="btn btn-outline-warning btn-lg" />
                        <asp:Button ID="btnGestion" runat="server" Text="Dar de baja" CssClass="btn btn-outline-danger btn-lg" />
                    </div>
                </div>
                <div class="card-footer text-center text-muted small">
                    Panel de administración de socios
                </div>
            </div>
        </div>

        <div class="container mt-4">
            <div class="card shadow-lg border-warning">
                <div class="card-header bg-warning text-white text-center">
                    <h4>Gestión de la inscripcion</h4>
                </div>
                <div class="card-body bg-dark text-light">
                    <p class="text-center mb-4">Seleccioná una acción para administrar al socio.</p>

                    <div class="d-flex justify-content-center gap-3">
                        <asp:Button ID="Button2" runat="server" Text="ver membresia" CssClass="btn btn-outline-light btn-lg" />
                        <asp:Button ID="Button3" runat="server" Text="modificar" CssClass="btn btn-outline-warning btn-lg" />
                        <asp:Button ID="Button4" runat="server" Text="Dar de baja" CssClass="btn btn-outline-danger btn-lg" />
                        <asp:Button ID="Button5" runat="server" Text="Pagar" CssClass="btn btn-outline-success btn-lg" />
                        <asp:Button ID="Button6" runat="server" Text="Ver historialde pagos" CssClass="btn btn-outline-primary btn-lg" />
                    </div>
                </div>
                <div class="card-footer text-center text-muted small">
                    Panel de administración de la inscripcion
                </div>
            </div>
        </div>
    </columns>
</asp:Content>
