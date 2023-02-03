programa
{
	//Davyd, Felipe e Vitor de Amorin 
	
	inclua biblioteca Util --> u
	inclua biblioteca Texto--> t

	cadeia continuar_resp
	inteiro escolha_jogo = 0
	cadeia confirmo = " "
	inteiro num_aposta = 0
	real valor_total = 0.0, valor_aux = 0.0
	
	funcao inicio()
	{
		
		 escreva("Escolha qual jogo vc deseja jogar --> ( 1 = Mega-Sena, 2= Quina, 3 = Lotomania e 4 = Lotofácil)", "\n")
		 leia(escolha_jogo)
		 limpa()
	 	
		 escolha (escolha_jogo){
		 	caso 1:

		 	regra_jogo(1)
		 	escreva("\n","\n")
		 	se(confirmo == "ok"){
		 		n_aposta_valor(1)// Ele detecta o valor da sua aposta, converte em dinheiro.
		 		se(num_aposta < 6 ou num_aposta > 20){
		 			limpa()
		 			escreva("Numero informado é invalido, por favor reinicie o processo e informe um numero valido. \n")
		 			pare
		 		}
		 		escreva("\n")
			 	sorteio(1,60)
			 	escreva("\n")
			 	continuar_jogo()// Faz o loop do do escolha.
		 	}
		 	
		 	pare

		 	caso 2:
		 	
		 	regra_jogo(2)
		 	escreva("\n","\n")
		 	se(confirmo == "ok"){
		 		n_aposta_valor(2)
		 		se(num_aposta < 5 ou num_aposta > 15){
		 			limpa()
		 			escreva("Numero informado é invalido, por favor reinicie o processo e informe um numero valido. \n")
		 			pare
		 		}
		 		escreva("\n")
			 	sorteio(1,80)
			 	escreva("\n")
			 	continuar_jogo()	
		 	}

		 	pare

		 	caso 3:
		 	
	 		regra_jogo(3)
		 	escreva("\n","\n")
		 	se(confirmo == "ok"){
		 		n_aposta_valor(3)
		 		se(num_aposta < 50 ou num_aposta > 50){
		 			limpa()
		 			escreva("Numero informado é invalido, por favor reinicie o processo e informe um numero valido. \n")
		 			pare
		 		}
		 		escreva("\n")
			 	sorteio(1,99)
			 	escreva("\n")
			 	continuar_jogo()	
		 	}
		 	
		 	pare

		 	caso 4:

		 	regra_jogo(4)
		 	escreva("\n","\n")
		 	se(confirmo == "ok"){
		 		n_aposta_valor(4)
		 		se(num_aposta < 15 ou num_aposta > 20){
		 			limpa()
		 			escreva("Numero informado é invalido, por favor reinicie o processo e informe um numero valido. \n")
		 			pare
		 		}
		 		escreva("\n")
			 	sorteio(1,25)
			 	escreva("\n")
			 	continuar_jogo()	
		 	}

		 	pare

		 	caso contrario :
		 	escreva("Valor informado é invalido, por favor digite (1) para Mega-Sena, (2) para Quina, (3) para Lotomania ou (4) para Lotofácil \n")
		 	pare
		 	
		 }	 
	}
	funcao sorteio(inteiro n1, inteiro n2){

		inteiro numeros_sor[50]
		inteiro sor,x
		inteiro i,j,contador,repeticao = 0,repeticao_aux = 0,cresente_aux = 0

          // --> Sorteio dos numeros { inicio
		para( i = 0; i < num_aposta; i++){

			sor = sorteia(n1, n2)

			numeros_sor[i] = sor

		}
          // --> } fim
          
          // --> Faz os mumeros não se repetirem { inicio
		para(i = 0 ; i < num_aposta; i++){
			contador = 0
			para(j = 0; j < num_aposta; j++){
				se(numeros_sor[j] == numeros_sor[i]){
					contador++
				}
			}
			se(contador > 1){
				repeticao++
				
			}

			repeticao_aux = repeticao
			
		}

		enquanto(repeticao_aux > 0){
			para(i = 0; i < num_aposta ; i++){
				contador = 0
				para(j = i+1; j < num_aposta; j++){
					se(numeros_sor[j] == numeros_sor[i]){
						contador++
						sor = sorteia(n1, n2)
						numeros_sor[i] = sor
					}
					
				}
				se(contador > 1){
					repeticao++
				}
			}
			se(repeticao != -100000){
				repeticao--
				se(repeticao == -100000){
					repeticao_aux = 0
				}
			}
			
		}
          // --> } fim 
          
		repeticao = 0

          // --> Ordena os numeres em ordem crescente { inicio
		para(i = 0 ; i < num_aposta; i++){
			para(j = i + 1; j < num_aposta; j++){
				se(numeros_sor[j] < numeros_sor[i]){
					
					cresente_aux = numeros_sor[j]
					numeros_sor[j] = numeros_sor[i]
					numeros_sor[i] = cresente_aux 
				}
			}
		}
          // --> } fim 
  
          // --> Escreve os numeros {
		para(x = 0; x < num_aposta; x++){

			escreva(numeros_sor[x],"\n")
			
		}
		// --> } fim
		
		escreva("\n","O valor total é de: ",valor_total," Reais","\n")
		escreva("----------------------------------------------------------------------------------------------------------------")
			
	}
	funcao continuar_jogo(){
		
		escreva("Deseja continuar apostando ? (S) ou (N).","\n")
		leia(continuar_resp)
		t.caixa_baixa(continuar_resp)
		limpa()
		

		se(continuar_resp == "s" ou continuar_resp == "sim"){
			 escreva("Escolha qual jogo vc deseja jogar --> ( 1 = Mega-Sena, 2= Quina, 3 = Lotomania e 4 = Lotofácil)", "\n")
			 leia(escolha_jogo)
			 limpa()

			 escolha(escolha_jogo){
			 	caso 1:

				regra_jogo(1)
			 	escreva("\n","\n")
			 	se(confirmo == "ok"){
			 		n_aposta_valor(1)
		 		se(num_aposta < 6 ou num_aposta > 20 ){
		 			limpa()
		 			escreva("Numero informado é invalido, por favor reinicie o processo e informe um numero valido. \n")
		 			pare
		 		}
			 		escreva("\n")
				 	sorteio(1,60)
				 	escreva("\n")
				 	continuar_jogo()	
		 	     }
			 	pare

			 	caso 2:
			 	
		 		regra_jogo(2)
			 	escreva("\n","\n")
			 	se(confirmo == "ok"){
			 		n_aposta_valor(2)
		 		se(num_aposta < 5 ou num_aposta > 15){
		 			limpa()
		 			escreva("Numero informado é invalido, por favor reinicie o processo e informe um numero valido. \n")
		 			pare
		 		}
			 		escreva("\n")
				 	sorteio(1,80)
				 	escreva("\n")
				 	continuar_jogo()	
			 	}
			 	pare

			 	caso 3:

				regra_jogo(3)
			 	escreva("\n","\n")
			 	se(confirmo == "ok"){
			 		n_aposta_valor(3)
		 		se(num_aposta < 50 ou num_aposta > 50){
		 			limpa()
		 			escreva("Numero informado é invalido, por favor reinicie o processo e informe um numero valido. \n")
		 			pare
		 		}
			 		escreva("\n")
				 	sorteio(1,99)
				 	escreva("\n")
				 	continuar_jogo()	
			 	}

			 	pare

			 	caso 4:

				regra_jogo(4)
			 	escreva("\n","\n")
			 	se(confirmo == "ok"){
			 		n_aposta_valor(4)
			 	se(num_aposta < 15 ou num_aposta > 20){
		 			limpa()
		 			escreva("Numero informado é invalido, por favor reinicie o processo e informe um numero valido. \n")
		 			pare
		 		}
			 		escreva("\n")
				 	sorteio(1,25)
				 	escreva("\n")
				 	continuar_jogo()	
			 	}
			 	
			 	pare

			 	caso contrario:
			 	escreva("Valor informado é invalido, por favor digite (1) para Mega-Sena, (2) para Quina, (3) para Lotomania ou (4) para Lotofácil \n")
			 	pare
			 }
			 
		}senao{
			escreva("OK agradecemos por sua aposta e boa sorte. \n")
		}
	}
	funcao regra_jogo(inteiro regra_desse){

		se(regra_desse == 1){
			
			escreva("------------------------------------------Você escolheu: | Mega-Sena |------------------------------------------")
			escreva("\n")
			escreva("\nNa Mega-Sena a aposta mínima é de 6 numeros e a maxima é de 20 numeros. Os preços estaram na tabela a seguir: ")	
			escreva("\n \n")
			escreva("Quantidade de n° da aposta   |   Valor da aposta")
			escreva("\n")
			escreva("              6              |         4,50      ","\n","              7              |         31,50      ","\n","              8              |         126,00      ","\n","              9              |         378,00      ","\n","              10             |         945,00      ","\n","              11             |         2.079,00      ","\n","              12             |         4.158,00      ","\n","              13             |         7.722,00      ","\n","              14             |         13.513,50      ","\n","              15             |         22.522,50      ","\n","              16             |         36.036,00      ","\n","              17             |         55.692,00      ","\n","              18             |         83.538,00      ","\n","              19             |         122.094,00      ","\n","              20             |         174.420,00      ")
			escreva("\n \n")
			escreva("--> Digite (ok) para continuar a aposta: ")
			leia(confirmo)
			t.caixa_baixa(confirmo)
			escreva("\n")
			escreva("----------------------------------------------------------------------------------------------------------------")
			
		}senao se(regra_desse == 2){
			
			escreva("------------------------------------------Você escolheu: | Quina |------------------------------------------")
			escreva("\n")
			escreva("\nNa Quina a aposta mínima é de 5 numeros e a maxima é de 15 numeros. Os preços estaram na tabela a seguir: ")	
			escreva("\n \n")
			escreva("Quantidade de n° da aposta   |   Valor da aposta")
			escreva("\n")
			escreva("              5              |         2,00      ","\n","              6              |         12,00      ","\n","              7              |         42,00      ","\n","              8              |         112,00      ","\n","              9              |         252,00      ","\n","              10             |         504,00      ","\n","              11             |         924,00      ","\n","              12             |         1.584,00      ","\n","              13             |         2.574,00      ","\n","              14             |         4.004,00      ","\n","              15             |         6.006,00      ","\n")
			escreva("\n")
			escreva("--> Digite (ok) para continuar a aposta: ")
			leia(confirmo)
			t.caixa_baixa(confirmo)
			escreva("\n")
			escreva("----------------------------------------------------------------------------------------------------------------")
			
		}senao se(regra_desse == 3){
			
			escreva("------------------------------------------Você escolheu: | Lotomania |------------------------------------------")
			escreva("\n")
			escreva("\nNa Lotomania a aposta é unica, sendo de 50 numeros, onde concorre quem acertar os 20, 19, 18, 17, 16 ou 15 numeros . O preço estara na tabela a seguir: ")
			escreva("\n \n")
			escreva("Quantidade de n° da aposta   |   Valor da aposta")
			escreva("\n")
			escreva("              50             |         2,50      ","\n")
			escreva("\n")
			escreva("--> Digite (ok) para continuar a aposta: ")
			leia(confirmo)
			t.caixa_baixa(confirmo)
			escreva("\n")
			escreva("----------------------------------------------------------------------------------------------------------------")
			
		}senao se(regra_desse == 4){
			
			escreva("------------------------------------------Você escolheu: | Lotofacil |------------------------------------------")
			escreva("\n")
			escreva("\nNa Lotofacil a aposta mínima é de 15 numeros e a maxima é de 20 numeros. Os preços estaram na tabela a seguir: ")
			escreva("\n \n")
			escreva("Quantidade de n° da aposta   |   Valor da aposta")
			escreva("\n")
			escreva("              15             |         2,50      ","\n","              16             |         40,00      ","\n","              17             |         340,00      ","\n","              18             |         2.040,00      ","\n","              19             |         9.690,00      ","\n","              20             |         38.760,00      ","\n")
			escreva("\n")
			escreva("--> Digite (ok) para continuar a aposta: ")
			leia(confirmo)
			t.caixa_baixa(confirmo)
			escreva("\n")
			escreva("----------------------------------------------------------------------------------------------------------------")
	
		}
		
	}
	funcao n_aposta_valor(inteiro valor_desse){

		inteiro n_mega = 0, n_quina = 0, n_lotoma = 0, n_lotofa = 0
		real v_mega = 0.0, v_quina = 0.0, v_lotoma = 0.0, v_lotofa = 0.0
		
		se(valor_desse == 1){
			
			escreva("Escreva quantas apostas deseja fazer: ")
			leia(n_mega)
			num_aposta = n_mega
		
			escolha(n_mega){

				caso 6:
				v_mega = 4.50
				pare

				caso 7:
				v_mega = 31.50
				pare

				
				caso 8:
				v_mega = 126.00	
				pare

				
				caso 9:
				v_mega = 378.00
				pare

				
				caso 10:
				v_mega = 945.00
				pare

				
				caso 11:
				v_mega = 2079.00	
				pare
				
				caso 12:
				v_mega = 4158.00	
				pare

				
				caso 13:
				v_mega = 7722.00	
				pare

				
				caso 14:
				v_mega = 13513.50	
				pare

				
				caso 15:
				v_mega = 22522.50	
				pare

				
				caso 16:
				v_mega = 36036.00
				pare

				
				caso 17:
				v_mega = 55692.00	
				pare

				
				caso 18:
				v_mega = 83538.00	
				pare

				
				caso 19:
				v_mega = 122094.00
				pare

				
				caso 20:
				v_mega = 174420.00	
				pare

				caso contrario:
				escreva("Informe um numero valido de aposta")
				pare
			}
			
				valor_aux = v_mega
				valor_total = valor_aux + valor_total
				
		}senao se(valor_desse == 2){
			escreva("Escreva quantas apostas deseja fazer: ")
			leia(n_quina)
			num_aposta = n_quina

			escolha(n_quina){

				caso 5:
				
				v_quina = 2.00

				pare

				caso 6:
				
				v_quina = 12.00

				pare

				caso 7:
				
				v_quina = 42.00

				pare

				caso 8:
				
				v_quina = 112.00

				pare

				caso 9:
				
				v_quina = 252.00

				pare

				caso 10:
				
				v_quina = 504.00

				pare

				caso 11:

				v_quina = 924.00

				pare

				caso 12:

				v_quina = 1584.00

				pare

				caso 13:

				v_quina = 2574.00
				
				pare

				caso 14:

				v_quina = 4004.00	
				
				pare

				caso 15:

				v_quina = 6006.00	
				
				pare
				
			}

				valor_aux = v_quina
				valor_total = valor_aux + valor_total
			
		}senao se(valor_desse == 3){

			escreva("Escreva quantas apostas deseja fazer: ")
			leia(n_lotoma)
			num_aposta = n_lotoma

			escolha(n_lotoma){

				caso 50:
				v_lotoma = 2.50
				pare
			
			}

				valor_aux = v_lotoma
				valor_total = valor_aux + valor_total
			
		}senao se(valor_desse == 4){

			escreva("Escreva quantas apostas deseja fazer: ")
			leia(n_lotofa)
			num_aposta = n_lotofa

			escolha(n_lotofa){

				caso 15:

				v_lotofa = 2.50

				pare

				caso 16:

				v_lotofa = 40.00
				
				pare

				caso 17:

				v_lotofa = 340.00
				
				pare

				caso 18:

				v_lotofa = 2040.00
				
				pare

				caso 19:

				v_lotofa = 9690.00
				
				pare

				caso 20:

				v_lotofa = 38760.00
				
				pare
			}

				valor_aux = v_lotofa
				valor_total = valor_aux + valor_total
			
		}
	}
}
