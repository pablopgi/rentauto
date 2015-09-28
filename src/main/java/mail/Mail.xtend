package mail

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

class Mail {
	

	private String body;
	private String subject;
	private String to;
	private String from;

new(String body, String subject, String to, String from){
	this.body = body;
	this.subject = subject;
	this.to = to;
	this.from = from;
}	

}