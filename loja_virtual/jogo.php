<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Cello Games | Jogos</title>
	<link href="img/icone2.ico" rel="sortcut icon"/>
	<!--Responsividade-->
	<meta name="viewport" content="widht=device-widht,initial-scale=1"> 
	<!-- CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- JavaScript compilado-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Imagens Rodapé-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		.navbar {
			margin-bottom: 0;
		}

		#busca{
			height: 30px;
			margin-top: 7px;
		}
	</style>
</head>
<body>
	<?php 

		session_start();
		include 'conexao.php';
		include 'nav.php';
		include 'cabecalho.html'; 
		
		$cat= $_GET['cat'];
		//variável $consulta vai receber variável $cn que receberá o resultado de uma query 
		$consulta = $cn->query("select cod_produto,nome_produto,valor_preco,descricao_capa, qtd_estoque from view_produto where descricao_categoria_produto = '$cat'");
	?>
	
	<br/>
	<div class="container-fluid">
		<div class="row">
				<?php while ($exibe = $consulta->fetch(PDO::FETCH_ASSOC)){ ?>
					<div class="col-sm-3">
						<img src="img/<?php echo $exibe['descricao_capa']; ?>" class="img-responsive" style="width: 100%"/>
						<div>
							<h4><b><?php echo mb_strimwidth($exibe['nome_produto'],0,25,'...'); ?></b></h4> 
							<!--depois de 30 caracteres vai ser mostrado na tela '...'-->
						</div>
						<div>
							<h6>R$ <?php echo number_format($exibe['valor_preco'],2,',','.'); ?></h6>
						</div>
					
						<div class="text-center">
							<a href="detalhe.php?cod=<?php echo $exibe['cod_produto'];?>">
								<button class="btn btn-sm btn-block btn-info">
									<span class="glyphicon glyphicon-info-sign"> Detalhes</span>
								</button>
							</a>
						</div>

						<div class="text-center" style="margin-top: 5px; margin-bottom: 5px;">
							<?php if($exibe['qtd_estoque'] > 0){  ?>	
								<a href="carrinho.php?cod=<?php echo $exibe['cod_produto'];?>">
									<button class="btn btn-sm btn-block btn-success">
										<span class="glyphicon glyphicon-usd"> Comprar</span>
									</button>
								</a>
							<?php } else { ?>	
								<button class="btn btn-sm btn-block btn-danger" disabled>
									<span class="glyphicon glyphicon-remove-circle"> Indisponível</span>
								</button>
							<?php } ?>	
						</div>
					</div>
				<?php } ?>
		</div> <!--Fechamento da class row-->
	</div> <!--Fechamento do container fluid-->

	<?php
		include 'rodape.html'; 
	?>
</body>
</html>