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
                        <asp:Button ID="btnVerDatosPersonales" runat="server" Text="Datos personales" CssClass="btn btn-outline-light btn-lg" OnClick="btnVerDatosPersonales_Click" />
                        <asp:Button ID="btnModificar" runat="server" Text="modificar" CssClass="btn btn-outline-warning btn-lg"  OnClick="btnModificar_Click"/>
                        <asp:Button ID="btnDarDeBaja" runat="server" Text="Dar de baja" CssClass="btn btn-outline-danger btn-lg" OnClick="btnDarDeBaja_Click"/>
                        <asp:Button ID="btnReactivar" runat="server" Text="Reactivar" CssClass="btn btn-outline-success btn-lg"  OnClick="btnReactivar_Click"/>
                    </div>
                </div>
                <div class="card-footer bg-dark text-white text-center text-muted small">
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
                        <asp:Button ID="btnMembresia" runat="server" Text="ver membresia" CssClass="btn btn-outline-light btn-lg" OnClick="btnMembresia_Click" />
                        <asp:Button ID="btnModificarMembresia" runat="server" Text="Extender fecha de vencimiento" CssClass="btn btn-outline-warning btn-lg"  OnClick="btnModificarMembresia_Click"/>
                        <asp:Button ID="btnDarDeBajaMembresia" runat="server" Text="Borrar ultimo registro" CssClass="btn btn-outline-danger btn-lg" OnClick="btnDarDeBajaMembresia_Click"/>
                        <asp:Button ID="btnPagar" runat="server" Text="Pagar" CssClass="btn btn-outline-success btn-lg"  OnClick="btnPagar_Click"/>
                        <asp:Button ID="btnVerHistorialDePagos" runat="server" Text="Ver historial de pagos" CssClass="btn btn-outline-primary btn-lg" OnClick="btnVerHistorialDePagos_Click" />
                    </div>
                </div>
                <div class="card-footer bg-dark text-white text-center text-muted small">
                    Panel de administración de la inscripcion
                </div>
            </div>
        </div>
        <br />
         <asp:Button Text="Volver" runat="server" OnClick="Unnamed_Click" CssClass="btn btn-outline-danger btn-lg"/>
        <br />
        <br />
        <asp:Label id="lblAlerta" CssClass="bg-danger" runat="server" />
    </columns>
   
</asp:Content>
