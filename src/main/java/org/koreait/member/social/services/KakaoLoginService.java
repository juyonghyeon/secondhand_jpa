package org.koreait.member.social.services;

import lombok.RequiredArgsConstructor;
import org.koreait.global.libs.Utils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

@Lazy
@Service
@RequiredArgsConstructor
public class KakaoLoginService implements SocialLoginService {

    private Utils utils;


    @Value("${social.kakao.apikey}")
    private String apiKey;

    @Override
    public String getToken(String code) {
        return "";
    }

    @Override
    public boolean login(String token) {
        return true;
    }

    @Override
    public boolean exists(String token) {
        return false;
    }

    @Override
    public String getLoginUrl(String redirectUrl) {

        String redirectUri = utils.getUrl("/member/social/callback/kakao");

        return String.format("https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=%s&redirect_uri=%s&state=%s", apiKey, redirectUri, redirectUrl);
    }
}