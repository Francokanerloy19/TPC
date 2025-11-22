<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Membresia.aspx.cs" Inherits="TPC.Membresia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .centrar-vertical {
            min-height: 30vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            width: 300px; /* 🔹 Ajusta el ancho total de la tarjeta */
        }
    </style>

    <p class="text-center text-white display-3">Membresía</p>

    <div class="container">
        <div class="row">
            <asp:Repeater ID="repMembresias" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card shadow-lg border-success h-100">

                            <div class="card-header bg-success text-white text-center">
                                <asp:Label runat="server"
                                    Text='<%# Eval("Nombre") %>'
                                    Style="font-size: 22px; font-weight: bold;">
                                </asp:Label>
                            </div>

                            <div class="card-body bg-dark text-light">

                                <div class="d-flex justify-content-between align-items-center">

                                    <div>
                                        <label class="fw-bold">Días:</label>
                                        <asp:Label runat="server" Text='<%# Eval("DuracionDias") %>'></asp:Label>
                                    </div>

                                    <div>
                                        <label class="fw-bold">Monto $</label>
                                        <asp:Label runat="server"
                                            Text='<%# Eval("PrecioBase", "{0:0.00}") %>'>
                                        </asp:Label>
                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>



    <p class="text-center text-white display-3">Actividades extras</p>

    <asp:GridView ID="gvActividadExtra" runat="server" AutoGenerateColumns="False" DataKeyNames="IdActividad" CssClass="table table-dark table-striped table-hover text-center" BorderStyle="None">
        <Columns>
            <asp:BoundField DataField="IdActividad" HeaderText="#" />
            <asp:BoundField DataField="NombreActividad" HeaderText="Actividad" />
            <asp:BoundField DataField="PrecioExtra" HeaderText="$" />
            <asp:BoundField DataField="Descripción" HeaderText="Descripción" />
        </Columns>
    </asp:GridView>
    <div class="text-center">
        <asp:Button Text="Volver" ID="btnVolver" runat="server" CssClass="btn btn-outline-danger btn-lg" OnClick="btnVolver_Click" />
    </div>

</asp:Content>
