package api.kakao;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.semi.lecture.model.service.AppForClassService;
import com.semi.lecture.model.vo.AppForClass;

import lombok.extern.java.Log;

/**
 * Servlet implementation class KakaoPayServlet
 */
@Service
@Log
@WebServlet("/kakaoPay")
public class KakaoPayServlet extends HttpServlet {
	 private static final String HOST = "https://kapi.kakao.com";
	 private KakaoPayReadyVO kakaoPayReadyVO;
	 private static final long serialVersionUID = 1L;

    public KakaoPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int lecNum = Integer.parseInt(request.getParameter("lecNum"));
		HttpSession session = request.getSession();	//로그인된 회원 정보 받아옴
		String mid = (String)session.getAttribute("memberLogin");	
		String text = request.getParameter("sText");
		int price = Integer.parseInt(request.getParameter("price"));
		
		int sNum = new AppForClassService().insertAppForClass(lecNum, mid, text, price);
		
		AppForClass afc = new AppForClassService().selectAppForClass(sNum, mid, lecNum);
		
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "1fe73d9df04e239c6c80c8ee694e6a07");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("item_name", afc.getLecture().getLecName());
        params.add("quantity", "1");
        params.add("price", ""+afc.getsPrice());
        params.add("approval_url", "http://localhost:8080/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8080/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
 
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("" + kakaoPayReadyVO);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
