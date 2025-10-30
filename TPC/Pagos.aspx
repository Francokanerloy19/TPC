<%@ Page Title="Pagos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="TPC.Pagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Seleccioná tu membresía</h2>

        <div class="row justify-content-center">
            <!-- Tarjeta 1: Membresía básica -->
            <div class="col-md-4 mb-3">
                <div class="card text-center shadow-lg border-success">
                    <div class="card-header bg-success text-white">
                        <h4>Membresía Básica</h4>
                    </div>
                    <div class="card-body bg-dark text-light">
                        <h2 class="fw-bold">$35.000</h2>
                        <p class="card-text">Acceso al gimnasio durante 30 días.</p>
                        <asp:Button ID="btnBasica" runat="server" CssClass="btn btn-success mt-3" Text="Elegir Plan" OnClick="btnBasica_Click" />
                    </div>
                </div>
            </div>

            <!-- Tarjeta 2: Membresía Premium -->
            <div class="col-md-4 mb-3">
                <div class="card text-center shadow-lg border-warning">
                    <div class="card-header bg-warning text-dark">
                        <h4>Membresía + Actividades</h4>
                    </div>
                    <div class="card-body bg-dark text-light">
                        <h2 class="fw-bold">$50.000</h2>
                        <p class="card-text">Incluye clases de funcional, spinning y yoga.</p>
                        <asp:Button ID="btnPremium" runat="server" CssClass="btn btn-warning mt-3" Text="Elegir Plan" OnClick="btnPremium_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
