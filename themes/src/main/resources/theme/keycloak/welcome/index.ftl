<!--
  ~ JBoss, Home of Professional Open Source.
  ~ Copyright (c) 2011, Red Hat, Inc., and individual contributors
  ~ as indicated by the @author tags. See the copyright.txt file in the
  ~ distribution for a full listing of individual contributors.
  ~
  ~ This is free software; you can redistribute it and/or modify it
  ~ under the terms of the GNU Lesser General Public License as
  ~ published by the Free Software Foundation; either version 2.1 of
  ~ the License, or (at your option) any later version.
  ~
  ~ This software is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  ~ Lesser General Public License for more details.
  ~
  ~ You should have received a copy of the GNU Lesser General Public
  ~ License along with this software; if not, write to the Free
  ~ Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
  ~ 02110-1301 USA, or see the FSF site: http://www.fsf.org.
  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 
<html>
<head>
    <title>Welcome to ${productNameFull}</title>

    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <link rel="shortcut icon" href="${resourcesCommonPath}/img/favicon.ico" />

    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

<body>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2">
      <div class="welcome-header">
        <img src="${resourcesPath}/bigConnect_w.svg" alt="${productName}" border="0" />
        <h1>Welcome to <strong>${productNameFull}</strong></h1>
      </div>
      <div class="row">
        <div class="col-xs-12 col-sm-4">
          <div class="card-pf h-l">
            <#if successMessage?has_content>
                <p class="alert success">${successMessage}</p>
            <#elseif errorMessage?has_content>
                <p class="alert error">${errorMessage}</p>
                <h3><img src="welcome-content/user.svg">Administration Console</h3>
            <#elseif bootstrap>
                <#if localUser>
                    <h3><img src="welcome-content/user.svg">Administration Console</h3>
                    <p>Please create an initial admin user to get started.</p>
                <#else>
                    <p class="welcome-message">
                        <img src="welcome-content/alert.png">You need local access to create the initial admin user. <br><br>Open <a href="http://localhost:8080/auth">http://localhost:8080/auth</a>
                        <br>or use the add-user-keycloak script.
                    </p>
                </#if>
            </#if>

            <#if bootstrap && localUser>
                <form method="post" class="welcome-form">
                    <p>
                        <label for="username">Username</label>
                        <input id="username" name="username" />
                    </p>

                    <p>
                        <label for="password">Password</label>
                        <input id="password" name="password" type="password" />
                    </p>

                    <p>
                        <label for="passwordConfirmation">Password confirmation</label>
                        <input id="passwordConfirmation" name="passwordConfirmation" type="password" />
                    </p>

                    <input id="stateChecker" name="stateChecker" type="hidden" value="${stateChecker}" />

                    <button id="create-button" type="submit" class="btn btn-primary">Create</button>
                </form>
            </#if>
            <div class="welcome-primary-link">
              <h3>
              <a href="${adminUrl}">
              <svg viewBox="64 64 896 896" data-icon="user" aria-hidden="true">
              <path d="M858.5 763.6a374 374 0 0 0-80.6-119.5 375.63 375.63 0 0 0-119.5-80.6c-.4-.2-.8-.3-1.2-.5C719.5 518 760 444.7 760 362c0-137-111-248-248-248S264 225 264 362c0 82.7 40.5 156 102.8 201.1-.4.2-.8.3-1.2.5-44.8 18.9-85 46-119.5 80.6a375.63 375.63 0 0 0-80.6 119.5A371.7 371.7 0 0 0 136 901.8a8 8 0 0 0 8 8.2h60c4.4 0 7.9-3.5 8-7.8 2-77.2 33-149.5 87.8-204.3 56.7-56.7 132-87.9 212.2-87.9s155.5 31.2 212.2 87.9C779 752.7 810 825 812 902.2c.1 4.4 3.6 7.8 8 7.8h60a8 8 0 0 0 8-8.2c-1-47.8-10.9-94.3-29.5-138.2zM512 534c-45.9 0-89.1-17.9-121.6-50.4S340 407.9 340 362c0-45.9 17.9-89.1 50.4-121.6S466.1 190 512 190s89.1 17.9 121.6 50.4S684 316.1 684 362c0 45.9-17.9 89.1-50.4 121.6S557.9 534 512 534z"></path></svg>
              <span>Administration Console</span>
              <i class="fa fa-angle-right link" aria-hidden="true"></i>
              </a></h3>
              <div class="description">
                Centrally manage all aspects of the ${productNameFull} server
              </div>
            </div>
          </div>
        </div>
        <div class="col-xs-12 col-sm-4">
          <div class="card-pf h-l">
            <h3><a href="${properties.documentationUrl}">
            <svg viewBox="64 64 896 896" data-icon="snippets" aria-hidden="true"><path d="M832 112H724V72c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v40H500V72c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v40H320c-17.7 0-32 14.3-32 32v120h-96c-17.7 0-32 14.3-32 32v632c0 17.7 14.3 32 32 32h512c17.7 0 32-14.3 32-32v-96h96c17.7 0 32-14.3 32-32V144c0-17.7-14.3-32-32-32zM664 888H232V336h218v174c0 22.1 17.9 40 40 40h174v338zm0-402H514V336h.2L664 485.8v.2zm128 274h-56V456L544 264H360v-80h68v32c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-32h152v32c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-32h68v576z"></path></svg>
            <span>Documentation</span>
            <i class="fa fa-angle-right link" aria-hidden="true"></i></a></h3>
            <div class="description">
              User Guide, Admin REST API and Javadocs
            </div>
          </div>
        </div>
        <div class="col-xs-12 col-sm-4">
        <#if properties.displayCommunityLinks = "true">
          <div class="card-pf h-m">
            <h3>
            <a href="http://www.keycloak.org">
            <svg width="20" viewBox="0 0 30 34" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M27.9603 13.5209C28.6031 13.8411 29.1374 14.3409 29.4972 14.9587C29.857 15.5766 30.0267 16.2854 29.9852 16.9977C30.0505 17.694 29.8988 18.3933 29.5506 19.0013C29.2024 19.6093 28.6745 20.0966 28.0382 20.3973L6.54363 33.0683C4.8303 34.15 3.50636 34.3045 2.41605 33.4547C1.85128 32.9247 1.35432 32.3279 0.936353 31.6776C0.464645 30.9502 0.146708 30.1354 0.00180583 29.2825C-0.0155215 28.8248 0.0921093 28.371 0.313321 27.969C0.90708 27.232 1.64991 26.6267 2.49393 26.192L18.0697 17.075L2.49393 7.95803C1.8709 7.49446 1.4815 7.18541 1.16999 6.95362C0.842608 6.72666 0.573434 6.42669 0.384081 6.07782C0.194728 5.72895 0.0904716 5.34089 0.0796847 4.9448C0.152487 4.08653 0.44758 3.26149 0.936353 2.54966C1.94878 0.849887 2.9612 0 3.81787 0C4.79383 0.0609185 5.73531 0.381156 6.54363 0.92715L27.9603 13.5209Z" fill="#21A79C"/>
            </svg>
            <span>Keycloak Project</span>
            <i class="fa fa-angle-right link" aria-hidden="true"></i></a></h3>
          </div>
          <div class="card-pf h-m">
            <h3>
            <a href="https://groups.google.com/forum/#!forum/keycloak-user">
            <svg viewBox="64 64 896 896" data-icon="mail" aria-hidden="true"><path d="M928 160H96c-17.7 0-32 14.3-32 32v640c0 17.7 14.3 32 32 32h832c17.7 0 32-14.3 32-32V192c0-17.7-14.3-32-32-32zm-40 110.8V792H136V270.8l-27.6-21.5 39.3-50.5 42.8 33.3h643.1l42.8-33.3 39.3 50.5-27.7 21.5zM833.6 232L512 482 190.4 232l-42.8-33.3-39.3 50.5 27.6 21.5 341.6 265.6a55.99 55.99 0 0 0 68.7 0L888 270.8l27.6-21.5-39.3-50.5-42.7 33.2z"></path></svg>
            <span>Mailing List</span>
            <i class="fa fa-angle-right link" aria-hidden="true"></i></a></h3>
          </div>
          <div class="card-pf h-m">
            <h3><a href="https://issues.jboss.org/browse/KEYCLOAK">
            <svg viewBox="64 64 896 896" data-icon="code" aria-hidden="true"><path d="M516 673c0 4.4 3.4 8 7.5 8h185c4.1 0 7.5-3.6 7.5-8v-48c0-4.4-3.4-8-7.5-8h-185c-4.1 0-7.5 3.6-7.5 8v48zm-194.9 6.1l192-161c3.8-3.2 3.8-9.1 0-12.3l-192-160.9A7.95 7.95 0 0 0 308 351v62.7c0 2.4 1 4.6 2.9 6.1L420.7 512l-109.8 92.2a8.1 8.1 0 0 0-2.9 6.1V673c0 6.8 7.9 10.5 13.1 6.1zM880 112H144c-17.7 0-32 14.3-32 32v736c0 17.7 14.3 32 32 32h736c17.7 0 32-14.3 32-32V144c0-17.7-14.3-32-32-32zm-40 728H184V184h656v656z"></path></svg>
            <span>Report an issue</span>
            <i class="fa fa-angle-right link" aria-hidden="true"></i></a></h3>
          </div>
        </#if>
        </div>
      </div>
      <div class='footer'>
        <#if properties.displayCommunityLinks = "true">
         <a href="http://www.jboss.org"><img src="welcome-content/jboss_community_txt.png" alt="JBoss and JBoss Community"></a>
        <a href="http://www.jboss.org"><img src="welcome-content/JBoss_logo.png" alt="JBoss and JBoss Community"></a>
        </#if>
      </div>
    </div>
  </div>
</div>
</body>
</html>
