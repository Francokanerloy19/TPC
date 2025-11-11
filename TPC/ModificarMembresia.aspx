<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarMembresia.aspx.cs" Inherits="TPC.ModificarMembresia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>   
        function validar() {
            const txtFechaInscripcion = document.getElementById("<%=txtFechaInscripcion.ClientID%>");
            const exRegularFechaInscripcion = /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/;
            const txtFechaVencimiento = document.getElementById("<%=txtFechaVencimiento.ClientID%>");
            const exRegularFechaVencimiento = /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/;




            let valido = true;
            if (!exRegularFechaInscripcion.test(txtFechaInscripcion.value.trim())) {
                txtFechaInscripcion.classList.add("is-invalid");
                txtFechaInscripcion.classList.remove("is-valid");
                valido = false;
            } else {
                txtFechaInscripcion.classList.remove("is-invalid");
                txtFechaInscripcion.classList.add("is-valid");

            }
            if (!exRegularFechaInscripcion.test(txtFechaInscripcion.value.trim())) {
                txtFechaVencimiento.classList.add("is-invalid");
                txtFechaVencimiento.classList.remove("is-valid");
                valido = false;
            } else {
                txtFechaVencimiento.classList.remove("is-invalid");
                txtFechaVencimiento.classList.add("is-valid");

            }



            return valido;


        }


    </script>

    <div class="container mt-4 bg-dark text-white">
        <div class="card shadow-lg border-primary bg-dark text-white">
            <div class="card-header bg-primary text-white text-center">
                <h3>Datos personales</h3>
            </div>

            <div class="card-body bg-dark text-white">
                <div class="row mb-3">
                    <div class="col">
                        <label class="form-label">Membresia: </label>
                        <br />
                        <asp:Label ID="lblMembresia" runat="server" CssClass=" fw-bold text-white"></asp:Label>



                    </div>

                    <div class="col">
                        <label class="form-label">Activida EXtra: </label>
                        <br />
                        <asp:Label ID="lblActividaEXtra" runat="server" CssClass=" fw-bold text-white"></asp:Label>


                    </div>

                    <div class="col">
                        <label class="form-label">Descripcion: </label>
                        <br />
                        <asp:Label ID="lblDescripcion" runat="server" CssClass=" fw-bold text-white"></asp:Label>


                    </div>
                </div>
                <div class="row mb-3 justify-content-center">
                    <div class="col-md-4 text-center">
                        <label for="txtFechaInscripcion" class="form-label">Fecha de inscripcion</label>
                        <br />
                        <asp:Label ID="txtFechaInscripcion" runat="server" CssClass=" fw-bold text-white"></asp:Label>
                    </div>

                    <div class="col-md-4 text-center">
                        <label for="FechaVencimiento" class="form-label">Fecha de vencimiento</label>
                        <asp:TextBox runat="server" ID="txtFechaVencimiento" TextMode="Date" CssClass="form-control mx-auto w-75" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFechaVencimiento" ErrorMessage="Formato incorrecto (AAAA/MM/DD)" CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFechaVencimiento" ValidationExpression="^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$" ErrorMessage="Formato incorrecto (DD/MM/AAAA)" CssClass="text-danger" Display="Dynamic" />

                    </div>


                </div>
            </div>

            <div class="card-footer text-center bg-dark">
                <asp:Button Text="Actualizar" ID="btnModificar" runat="server" CssClass="btn btn-success mx-2" OnClientClick="return validar()" OnClick="btnModificar_Click" />
                <asp:Button Text="Cancelar" ID="btnCancelar" runat="server" CssClass="btn btn-danger mx-2" CausesValidation="false"  OnClick="btnCancelar_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
