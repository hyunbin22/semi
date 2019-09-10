package api.kakao;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class KakaoPayController {
	
	@Setter(onMethod = @Autowired)
	private KakaoPay kakaoPay;
	
	@GetMapping("/kakaoPay")
	public void kakaoPayGet() {
		
	}
	
	@PostMapping("/kakaoPay")
    public String kakaoPay() {
        
        return "redirect:" + kakaoPay.kakaoPayReady();
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {

        
    }
	

}
