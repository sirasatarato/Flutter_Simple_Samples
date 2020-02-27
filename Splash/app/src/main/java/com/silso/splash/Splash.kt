package com.silso.splash

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import androidx.core.os.postDelayed

class Splash : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)

        val hd: Handler = Handler()
        hd.postDelayed(splashhandler(), 3000)
    }

    inner class splashhandler: Runnable{
        override fun run() {
            startActivity(Intent(this@Splash, MainActivity::class.java)) //로딩이 끝난 후, ChoiceFunction 이동
            finish() // 로딩페이지 Activity stack에서 제거
        }
    }

    override fun onBackPressed() {}
}
