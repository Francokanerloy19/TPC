<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TPC.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Panel del Gimnasio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            body {
                background-color: #0d1117;
                color: #e6edf3;
            }

            .card {
                border: none;
                border-radius: 1rem;
            }

            .priority-high {
                border-left: 4px solid #f85149;
            }

            .priority-medium {
                border-left: 4px solid #f1e05a;
            }

            .btn-custom {
                background-color: #238636;
                border: none;
            }
   
        </style>
    </head>
    <body>

        <div class="container py-3">

            <!-- Acciones requeridas -->
            <h5 class="mb-3">Acciones Requeridas</h5>

            <div class="row mb-4">
    <div class="col-md-6">
        <div class="card bg-dark priority-high p-3">
            <h6 class="text-danger"><i class="bi bi-exclamation-circle"></i> Alta Prioridad</h6>
            <p class="text-secondary">Membresías inactivas.</p>
            <asp:Button Text="Resolver Ahora" class="btn btn-custom btn-sm" runat="server" />
        </div>
    </div>

    <div class="col-md-6">
        <div class="card bg-dark priority-medium p-3">
            <h6 class="text-warning"><i class="bi bi-hourglass-split"></i> Prioridad Media</h6>
            <p class="text-secondary">Membresías por Vencer.</p>
            <asp:Button Text="Ver Todos" class="btn btn-secondary btn-sm" runat="server" />
        </div>
    </div>
</div>

            <!-- Resumen del Gimnasio -->
            <h5>Resumen del Gimnasio</h5>
            <div class="row text-center mb-4">
                <div class="col-6 mb-3">
                    <div class="card bg-dark p-3">
                        <i class="bi bi-people fs-4"></i>
                        <h4>452</h4>
                        <!-- Hace referencia a los socios activos -->
                        <p class="text-secondary mb-0">Socios Activos</p>
                    </div>
                </div>
                <div class="col-6 mb-3">
                    <div class="card bg-dark p-3">
                        <i class="bi bi-cash-coin fs-4"></i>
                        <h4>$12.5k</h4>
                        <!--Recaudacion mensual -->
                        <p class="text-secondary mb-0">Ingresos Mensuales</p>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card bg-dark p-3">
                        <i class="bi bi-calendar-x fs-4"></i>
                        <h4>12</h4>
                        <!-- Socios que estan a una semana del vencimiento de la menbresia -->
                        <p class="text-secondary mb-0">Vencen Esta Semana</p>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card bg-dark p-3">
                        <i class="bi bi-person-plus fs-4"></i>
                        <h4>25</h4>
                        <!-- Nuevos socios -->
                        <p class="text-secondary mb-0">Nuevos Socios (Mes)</p>
                    </div>
                </div>
            </div>

            <!-- Membresías por Vencer -->
            <h5>Membresías por Vencer</h5>
            <!-- Apareceran los socios con 3 dias antes del vencimiento a los cuales se los contactaran por correo -->
            <div class="card bg-dark mb-2 p-3 d-flex justify-content-between align-items-center">
                <div>

                    <small class="text-secondary">Vence: 28 Oct 2023</small>
                </div>

                <asp:Button Text="Contactar" class="btn btn-custom btn-sm" runat="server" />
            </div>

            <div class="card bg-dark mb-2 p-3 d-flex justify-content-between align-items-center">
                <div>

                    <small class="text-secondary">Vence: 29 Oct 2023</small>
                </div>
                <asp:Button Text="Contactar" class="btn btn-custom btn-sm" runat="server" />

            </div>

            <div class="card bg-dark mb-5 p-3 d-flex justify-content-between align-items-center">
                <div>

                    <small class="text-secondary">Vence: 30 Nov 2023</small>
                </div>
                <asp:Button Text="Contactar" class="btn btn-custom btn-sm" runat="server" />

            </div>
        </div>



    </body>
    </html>

</asp:Content>
