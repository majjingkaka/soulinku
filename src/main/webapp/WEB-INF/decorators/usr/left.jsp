<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>


<!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo" style="padding-left: 1.5rem;">
            <a href="/" class="app-brand-link">
              
              <img src="/static/bible/img/favicon/favicon-32x32.png" />
              <span class="app-brand-text menu-text fw-bolder ms-1" style="font-size: 30px;">soulinku</span><!-- HeartStory -->
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
          	
          	<li class="menu-header small text-uppercase">
              <span class="menu-header-text">Pages</span>
            </li>

            <!-- Dashboard -->
            <li class="menu-item <c:if test="${menuId eq 'bibleSearch'}">active</c:if>">
              <a href="/bible/bibleSearch/list.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-brush"></i>
                <div data-i18n="Analytics">말씀 찾기</div>
              </a>
            </li>
            
            <li class="menu-item <c:if test="${menuId eq 'bibleSayRecord'}">active</c:if>">
              <a href="/bible/bibleSayRecord/list.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-brightness-half"></i>
                <div data-i18n="Analytics">말씀 기록장</div>
              </a>
            </li>
            
            <li class="menu-item <c:if test="${menuId eq 'bibleTicket'}">active</c:if>">
              <a href="/bible/bibleTicket/list.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-brightness-half"></i>
                <div data-i18n="Analytics">말씀 뽑기</div>
              </a>
            </li>
            
            <li class="menu-item <c:if test="${menuId eq 'biblePick'}">active</c:if>">
              <a href="/bible/biblePick/list.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-brightness-half"></i>
                <div data-i18n="Analytics">말씀 픽</div>
              </a>
            </li>
            
            <li class="menu-item <c:if test="${menuId eq 'biblePray'}">active</c:if>">
              <a href="/bible/biblePray/list.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-brightness-half"></i>
                <div data-i18n="Analytics">기도문</div>
              </a>
            </li>
            
            <li class="menu-item <c:if test="${menuId eq 'biblePrayer'}">active</c:if>">
              <a href="/bible/biblePrayer/list.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-brightness-half"></i>
                <div data-i18n="Analytics">중보기도문</div>
              </a>
            </li>
            
            
          </ul>
        </aside>
        <!-- / Menu -->

