package pl.altkom.web.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class GreetingsTag extends TagSupport {
    private String name;

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public int doStartTag() throws JspException {
        JspWriter out = pageContext.getOut();
        try {
            out.write("WITAJ OKRUTNY ŚWIECIE!");
            if (name != null) {
                out.write("Powiedział " + name);
            }
        } catch (IOException e) {
            e.printStackTrace();
            new JspException("Nie da się", e);
        }
        return SKIP_BODY;
    }
}
