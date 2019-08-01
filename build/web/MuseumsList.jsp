<%@page import="entity.Museumtpye"%>
<%@page import="entity.City"%>
<%@page import="java.util.List"%>
<%@page import="entity.Museum"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="parts/header.jsp" %>

<script>
    
    $.urlParam = function (name) {
    var results = new RegExp('[\?&]' + name + '=([^&#]*)')
                      .exec(window.location.search);

    return (results !== null) ? results[1] || 0 : false;
}

    $(document).ready(function(){
        
        if($.urlParam("city")!=null && $.urlParam("city").length>0)
       $("#city").val($.urlParam("city"));
   
       if($.urlParam("type")!=null && $.urlParam("type").length>0)
        $("#type").val($.urlParam("type"));
    });
    
</script>

<div class="row">
    <div class="col">


        <br/>
        <br/>
        <br/>
        <br/>
        <h1>Search museums</h1>
        <br/>
        <form>
            <input type="hidden" name="searchfrm" value="2" />
            <div class="form-row">
                <div class="col-7">
                    <select id="city" name="city" class="form-control">
                        <option value="0">select city...</option>
                        <% 
                            
                            List<City> cities = (List<City>) request.getAttribute("cities");

                            for (City city : cities) {

                        %>
                        
                         <option  value="<%=city.getId()%>"><%=city.getName()%></option>

                        <% }
                        
                        %>
                    </select>
                </div>
                <div class="col">
                    <select id="type" name="type" class="form-control">
                        <option value="0">select type...</option>
                        <% 
                            List<Museumtpye> types = (List<Museumtpye>) request.getAttribute("types");

                            for (Museumtpye type : types) {
                        %>

                        <option value="<%=type.getId()%>"><%=type.getName()%></option>

                        <%}%>
                    </select>
                </div>
                <div class="col">
                    <button class="form-control btn btn-secondary" type="submit">Search</button>
                </div>
            </div>
        </form>
        <br/>
        <ul class="museums-list">
            <% List<Museum> museums = (List<Museum>) request.getAttribute("museums");

                for (Museum museum : museums) {
            %>
            <div class="li-item">
                <a href="/MuseumsIS/details?id=<%=museum.getId()%>">
                    <div class="mus-image" style="background-image: url('<%=museum.getImageurl()%>')">
                    </div>

                    <div class="mus-description">
                        <h3><%=museum.getName()%></h3>
                        <p><i><%=museum.getAddress()%>, <%=museum.getCity().getName()%></i></p>
                        <span class="badge badge-warning"><%=museum.getMuseumtpye().getName()%></span>
                    </div>
                </a>
            </div> 
            <%
                }
            %>
        </ul>

    </div>
</div>

<%@include file="parts/footer.jsp" %>
