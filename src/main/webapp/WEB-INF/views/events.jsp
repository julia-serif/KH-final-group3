<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>One Music - Modern Music HTML5 Template</title>

    <!-- Favicon -->
    <link rel="icon" href="<%= request.getContextPath() %>/resources/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/style.css">

</head>
<body>
    <jsp:include page="/resources/include/header.jsp"></jsp:include>

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Events</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    <!-- ##### Events Area Start ##### -->
    <section class="events-area section-padding-100">
        <div class="container">
            <div class="row">

                <!-- Single Event Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="resources/img/bg-img/IU3.png" alt="">
                        </div>
                        <div class="event-text">
                            <h4>세상의 모든 TOP 100</h4>
                            <div class="event-meta-data">
                                <a href="#" class="event-place">IU</a>
                                <a href="#" class="event-date">July 7, 2022</a>
                            </div>
                            <a href="<%= request.getContextPath() %>/event1.do" class="btn see-more-btn">See Event</a>
                        </div>
                    </div>
                </div>
                

                <!-- Single Event Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="resources/img/bg-img/event3.png" alt="">
                        </div>
                        <div class="event-text">
                            <h4>감사 이벤트</h4>
                            <div class="event-meta-data">
                                <a href="#" class="event-place">고객 할인</a>
                                <a href="#" class="event-date">July 7, 2022</a>
                            </div>
                            <a href="<%= request.getContextPath() %>/event2.do" class="btn see-more-btn">See Event</a>
                        </div>
                    </div>
                </div>

                <!-- Single Event Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="resources/img/bg-img/re3.png" alt="">
                        </div>
                        <div class="event-text">
                            <h4>Planet ibiza</h4>
                            <div class="event-meta-data">
                                <a href="#" class="event-place">고객 추첨 이벤트</a>
                                <a href="#" class="event-date">July 7, 2022</a>
                            </div>
                            <a href="<%= request.getContextPath() %>/event3.do" class="btn see-more-btn">See Event</a>
                        </div>
                    </div>
                </div>

        </div>
    </section>
    <!-- ##### Events Area End ##### -->
    
    <!-- ##### Newsletter & Testimonials Area Start ##### -->
    <section class="newsletter-testimonials-area">
        <div class="container">
            <div class="row">

                

                

            </div>
        </div>
    </section>
    <!-- ##### Newsletter & Testimonials Area End ##### -->
    
    <jsp:include page="/resources/include/footer.jsp"></jsp:include>
</body>
</html>