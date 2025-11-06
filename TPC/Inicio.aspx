<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TPC.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
   
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
    

        <div class="container py-3">

            <!-- Acciones requeridas -->
            <h5 class="mb-3">Acciones Requeridas</h5>

            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="card bg-dark priority-high p-3">
                        <h6 class="text-danger"><i class="bi bi-exclamation-circle"></i>Alta Prioridad</h6>
                        <asp:Label ID="mbinactivas" runat="server" ForeColor="White" Font-Size="XX-Large" />
                        <p class="text-secondary">Membresías inactivas.</p>
                        <asp:Button Text="Resolver Ahora" class="btn btn-custom btn-sm" runat="server" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card bg-dark priority-medium p-3">
                        <h6 class="text-warning"><i class="bi bi-hourglass-split"></i>Prioridad Media</h6>
                        <asp:Label ID="MVencer" runat="server" ForeColor="White" Font-Size="XX-Large" />
                        <p class="text-secondary">Membresías por Vencer.</p>
                        <asp:Button ID="btnMVencer" Text="Ver Todos" class="btn btn-secondary btn-sm" runat="server" OnClick="btnMVencer_Click" />
                    </div>
                </div>
            </div>

            <!-- Resumen del Gimnasio -->
            <h5>Resumen del Gimnasio</h5>
            <div class="row text-center mb-4">
                <div class="col-6 mb-3">
                    <div class="card bg-dark p-3">
                        <i class="bi bi-people fs-4 text-white"></i>
                        <asp:Label ID="SociosActivos" runat="server" ForeColor="White" Font-Size="XX-Large" />
                        <!-- Hace referencia a los socios activos -->
                        <p class="text-secondary mb-0">Socios Activos</p>
                        
                    </div>
                </div>
                <div class="col-6 mb-3">
                    <div class="card bg-dark p-3">
                        <i class="bi bi-cash-coin fs-4  text-white"></i>
                        
                        <!--Recaudacion mensual -->
                        <p class="text-secondary mb-0">Ingresos Mensuales</p>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card bg-dark p-3">
                        <i class="bi bi-calendar-x fs-4  text-white"></i>
                        
                        <p class="text-secondary mb-0">Socio inactivos</p>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card bg-dark p-3">
                        <i class="bi bi-person-plus fs-4  text-white"></i>
                        
                        <!-- Nuevos socios -->
                        <p class="text-secondary mb-0">Nuevos Socios (Mes)</p>
                    </div>
                </div>
            </div>

            <!-- Membresías por Vencer -->
            <h5>Membresías por Vencer</h5>
            <!-- Apareceran los socios con 3 dias antes del vencimiento a los cuales se los contactaran por correo -->
            <asp:GridView ID="gvSociosPorVencer" runat="server" AutoGenerateColumns="False" CssClass="table table-dark table-striped table-hover text-center" BorderStyle="None">
                <Columns>
                    <asp:BoundField DataField="IdSocio" HeaderText="#" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Correo" HeaderText="Correo" />
                    <asp:BoundField DataField="inscripcion.FechaVencimiento" HeaderText="Vencimiento" DataFormatString="{0:dd MMM yyyy}" />
                    <asp:TemplateField HeaderText="Acción">
                        <ItemTemplate>
                            <asp:Button ID="btnContactar" runat="server" Text="Contactar" CssClass="btn btn-custom btn-sm" CommandName="Contactar" CommandArgument='<%# Eval("Correo") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>



    

</asp:Content>
