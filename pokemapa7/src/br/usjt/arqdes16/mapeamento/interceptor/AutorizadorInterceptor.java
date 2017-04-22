package br.usjt.arqdes16.mapeamento.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.usjt.arqdes16.mapeamento.controller.LoginController;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {
		String uri = request.getRequestURI();
		
		if (uri.endsWith("loginForm") || uri.endsWith("fazer_login") || uri.endsWith("cadastro_usuario") || uri.endsWith("criar_usuario") ||uri.contains("res")  || uri.contains("rest")) {
			return true;
		}
		if (request.getSession().getAttribute(LoginController.USUARIO_LOGADO) != null) {
			return true;
		}
		response.sendRedirect("loginForm");
		return false;
	}
}
