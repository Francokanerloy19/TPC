<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HistorialPago.aspx.cs" Inherits="TPC.HistorialPago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <h2>Historial de pagos</h2>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            body {
                background-color: #0d1117;
                color: #e6edf3;
            }

            .btn-custom {
                background-color: #238636;
                border: none;
            }
        </style>
    </head>
    <body>

        <div class="container py-3">


            <!-- Apareceran los socios con 3 dias antes del vencimiento a los cuales se los contactaran por correo -->
            <asp:GridView ID="gvPagos" runat="server" AutoGenerateColumns="False"
                CssClass="table table-dark table-striped table-hover text-center" BorderStyle="None">
                <Columns>
                    <asp:BoundField DataField="IdPago" HeaderText="#" />
                    <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" DataFormatString="{0:dd MMM yyyy}" />
                    <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Metodo" HeaderText="Método" />
                </Columns>
            </asp:GridView>


        </div>



    </body>
    </html>

</asp:Content>
