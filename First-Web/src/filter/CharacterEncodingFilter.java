package filter;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.PRIVATE_MEMBER;

/**
 * Servlet Filter implementation class CharacterEncodingFilter
 */
@WebFilter(dispatcherTypes = {DispatcherType.REQUEST }
					, urlPatterns = { 
							"/*",
							"/request/*"
							}, servletNames = { "Loader" })
public class CharacterEncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CharacterEncodingFilter() {
    	
    	private String encoding;
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest HttpRequest = (HttpServletRequest) request;
		HttpRequest.setCharacterEncoding(encoding);
		
		chain.doFilter(request, response);
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		String paramValue = fConfig.getInitParameter("encoding");
		if(paramValue != null) {
			this.encoding = "utf-8";
		} else {
			this.encoding = paramValue;
		}
	}

}
