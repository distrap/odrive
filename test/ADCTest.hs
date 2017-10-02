
module Main where

import Ivory.Tower.Config
import Ivory.OS.FreeRTOS.Tower.STM32

import LDrive.Platforms
import LDrive.Tests.ADC (app)

main :: IO ()
main = compileTowerSTM32FreeRTOS testplatform_stm32 p $
        app (stm32config_clock . testplatform_stm32)
            testplatform_adc1
            testplatform_pwm
            testplatform_uart
            testplatform_leds
  where
  p topts = getConfig topts testPlatformParser
