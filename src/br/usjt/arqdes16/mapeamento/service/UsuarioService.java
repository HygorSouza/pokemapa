package br.usjt.arqdes16.mapeamento.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.usjt.arqdes16.mapeamento.dao.UsuarioDAO;
import br.usjt.arqdes16.mapeamento.model.Usuario;

@Service
public class UsuarioService {
	UsuarioDAO dao;
	@Autowired
	public UsuarioService(UsuarioDAO dao) {
		this.dao = dao;
	}
	
	public void criar(Usuario usuario) throws Exception{
		Usuario u = dao.selecionar(usuario.getUsername());
		if( u !=null){
			throw new Exception("Usuario existente");
		} else{
			dao.criar(usuario);
		}
		
	}
	
	public boolean validar(Usuario usuario) throws IOException{
		return dao.validar(usuario);
	}
	
	
}
