<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HistorialPago.aspx.cs" Inherits="TPC.HistorialPago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2>Historial de pagos</h2>


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


    <div class="container py-3">


        <!-- Apareceran los socios con 3 dias antes del vencimiento a los cuales se los contactaran por correo -->
        <asp:GridView ID="gvPagos" runat="server" AutoGenerateColumns="False"
            CssClass="table table-dark table-striped table-hover text-center" BorderStyle="None">
            <Columns>
                <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate> <%# Eval("socio.Nombre") %></ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Apellido">
                    <ItemTemplate> <%# Eval("socio.Apellido") %></ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="FechaPago" HeaderText="Fecha de Pago" DataFormatString="{0:dd MMM yyyy}" />
                <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:C}" />
                <asp:BoundField DataField="MetodoPago" HeaderText="Método" />
            </Columns>
        </asp:GridView>


    </div>






</asp:Content>
