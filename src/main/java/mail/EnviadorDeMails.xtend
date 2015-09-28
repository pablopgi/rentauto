package mail

import exceptions.NoPuedeEnviarMail

class EnviadorDeMails {
	
	def void enviarMail(Mail m){
		if((m.getTo() == "") ||(m.getFrom() == "") || (m.getBody() == ""))
			{
			throw new NoPuedeEnviarMail;
			}
			else
		System.out.println("Mensaje enviado exitosamente");
	}
}