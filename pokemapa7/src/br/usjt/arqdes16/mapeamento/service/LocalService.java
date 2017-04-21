package br.usjt.arqdes16.mapeamento.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import br.usjt.arqdes16.mapeamento.dao.CidadeDAO;
import br.usjt.arqdes16.mapeamento.dao.EstadoDAO;
import br.usjt.arqdes16.mapeamento.dao.LocalDAO;
import br.usjt.arqdes16.mapeamento.google.ResultadoGoogle;
import br.usjt.arqdes16.mapeamento.model.Cidade;
import br.usjt.arqdes16.mapeamento.model.Estado;
import br.usjt.arqdes16.mapeamento.model.Local;

@Service
public class LocalService {
	private LocalDAO localDAO;
	private CidadeDAO cidadeDAO;
	private EstadoDAO estadoDAO;
	private GoogleService googleService;

	@Autowired
	public LocalService(LocalDAO localDAO, CidadeDAO cidadeDAO, EstadoDAO estadoDAO, GoogleService googleService) {
		this.localDAO = localDAO;
		this.cidadeDAO = cidadeDAO;
		this.estadoDAO = estadoDAO;
		this.googleService = googleService;
	}

	public void criar(Local local) throws IOException {
		local = preencherLacunas(local);
		localDAO.criar(local);
	}

	public Local preencherLacunas(Local local) {
		Cidade cidade = cidadeDAO.selecionar(local.getCidade().getId());
		local.setCidade(cidade);
		Estado estado = estadoDAO.selecionar(local.getCidade().getEstado().getId());
		local.getCidade().setEstado(estado);

		ResultadoGoogle resultado = googleService.buscaGoogleMaps(local);

		local = googleService.getLocalizacao(resultado, local);

		return local;
	}

	public void remover(ServletContext servletContext, Local local) throws IOException {
		localDAO.excluir(local);
		File file = createFile(servletContext, local);
		if(file.exists()){
			file.delete();
		}
	}

	public void atualizar(Local local) throws IOException {
		local = preencherLacunas(local);
		localDAO.atualizar(local);
	}

	public List<Local> listarLocais() throws IOException {
		return localDAO.listarLocais();
	}

	public List<Local> listarLocais(String chave) throws IOException {
		return localDAO.listarLocais(chave);
	}

	public Local mostrar(Local local) throws IOException {
		return localDAO.selecionar(local.getId());
	}

	public void gravarImagem(ServletContext servletContext, Local local, MultipartFile file) throws IOException {
		if (!file.isEmpty()) {
			BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
			File destination = createFile(servletContext, local);
			atualizar(local);
			if (destination.exists()) {
				destination.delete();
			}

			ImageIO.write(src, "jpg", destination);
		}
	}

	private File createFile(ServletContext servletContext, Local local) throws IOException {
		String path = servletContext.getRealPath(servletContext.getContextPath());

		path = path.substring(0, path.lastIndexOf(File.separatorChar));

		String nomeArquivo = "img" + local.getId() + ".jpg";
		local.setImagem(nomeArquivo);
		
		File destination = new File(path + File.separatorChar + "res" + File.separatorChar + "img" + File.separatorChar + nomeArquivo);
		return destination;
	}

}
