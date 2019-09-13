<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>

    <section class="center1">
    <script>
        $(document).ready(function(){
            $(".notice-content").hide();
            $(".click-notice").click(function(){
                $(this).next().slideToggle(0);
            });
        });
    </script>
        <!-- <span id="notice-nav">
            <table id="notice-menu">
                <tr><td>Notice</td></tr>
                <tr><td>Event</td></tr>
                <tr><td>FAQ</0td></tr>
            </table>
        </span> -->
            <div class="notice-table">
                <table class="notice-top">
                    <th class="notice-highlight1"></th>
                    <th class="notice-date">작성일</th>
                    <th class="notice-title">제목</th>
                    <th class="notice-id">작성자</th>
                </table>
                <table>
                    <tr class="click-notice">
                        <td class="notice-highlight">
                            <div class="notice-highlight-div">
                                <strong class="notice-highlight-str">
                                    <span class="notice-highlight-span">필독</span>
                                </strong>
                            </div>
                        </td>
                        <td class="notice-date">d</td>
                        <td class="notice-title">d</td>
                        <td class="notice-id">d</td>
                        <tr class="notice-content">
                            <td colspan="4">
                                <pre class="notice-content2">
                                </pre>
                            </td>
                        </tr>
                    <tr class="null"><td colspan="4"></td></tr>
                </table>
            </div>
<%@ include file="/views/common/adminAside.jsp"%>
</section>


<%@ include file="/views/common/adminFooter.jsp"%>