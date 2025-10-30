<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Membresia.aspx.cs" Inherits="TPC.Membresia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Planes de membresía</h2>

        <div class="row justify-content-center">
            <!-- Membresía Básica -->
            <div class="col-md-4 mb-3">
                <div class="card text-center shadow-lg border-success">
                    <div class="card-header bg-success text-white">
                        <h4>Membresía Básica</h4>
                    </div>
                    <div class="card-body bg-dark text-light">
                        <h2 class="fw-bold text-success">$35.000</h2>
                        <p class="card-text">Acceso al gimnasio durante 30 días.</p>
                    </div>
                </div>
            </div>

            <!-- Membresía Premium -->
            <div class="col-md-4 mb-3">
                <div class="card text-center shadow-lg border-warning">
                    <div class="card-header bg-warning text-dark">
                        <h4>Membresía + Actividades</h4>
                    </div>
                    <div class="card-body bg-dark text-light">
                        <h2 class="fw-bold text-warning">$50.000</h2>
                        <p class="card-text">Incluye clases de funcional, spinning y yoga.</p>
                    </div>
                </div>
            </div>
        </div>
        
    </div>

</asp:Content>
