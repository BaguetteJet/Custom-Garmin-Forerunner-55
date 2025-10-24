# Watch Faces
My goal was to create personalized watch faces for the Garmin Forerunner 55, which features a transflective 8-bit display optimized for outdoor visibility and low power consumption.

To streamline development, I used the Connect IQ SDK to virtually emulate the watch, allowing me to test and debug watch faces without needing the physical device at every step.

All coding was done in Garmin’s MonkeyC programming language, a specialized language designed for Connect IQ apps and watch faces. MonkeyC combines concepts from several programming languages, including Java, JavaScript, and Python, providing a familiar syntax while being optimized for low-power wearable devices and small, high-performance screens.

Using this setup, I was able to experiment with custom fonts, color schemes, and dynamic elements, creating watch faces that are both functional and visually appealing on the FR55’s limited 208×208 pixel display.

## First Design: Retro 8-bit
My first design idea was inspired by old-school 8-bit color command-line terminals, featuring bold, contrasting colors and pixelated graphics. I aimed to capture the retro digital aesthetic while adapting it to the Forerunner 55’s limited display.   

<img width="387" height="611" alt="image" src="https://github.com/user-attachments/assets/03a3715a-11e2-48e2-84c9-9702f7136755" />  <img width="402" height="603" alt="image" src="https://github.com/user-attachments/assets/43fabd9f-8a8f-40c2-8bbe-c556511f5851" />
 
<img width="826" height="509" alt="image" src="https://github.com/user-attachments/assets/43ce51d7-4c4f-44b1-ad35-2fbcd64a531d" />

I really liked how this simple watch face turned. It was clean, colorful, and easy to read. However, it also lacked functionality beyond simply showing the time. To make it more useful, I decided to transform the eight colorful squares into a dynamic bar-chart display, where each color represents a different type of data. I switched out the "Hellow World" text for the day and date.

<img width="387" height="611" alt="image" src="https://github.com/user-attachments/assets/8cec08e6-aeb5-4e73-b602-656a1a3c4270" />   <img width="388" height="608" alt="image" src="https://github.com/user-attachments/assets/2f673998-7f56-4bd0-ad13-57ded4f1cd84" />


| **Colour**  |  **Data**                 |
|:--------|:------------------------------|
| `BLACK`   | -                           |
| `RED`     | heart rate                  |
| `GREEN`   | steps (% of my daily goal)  |
| `YELLOW`  | stress level                |
| `DK_BLUE` | bluetooth connection status |
| `PINK`    | battery %                   |
| `BLUE`    | body battery                |
| `WHITE`   | notifications               |

## Useful Links
- Basic tutrorial: https://medium.com/@ericbt/design-your-own-garmin-watch-face-21d004d38f99
- Codes Samples: https://starttorun.info/connect-iq-apps-with-source-code/
- SDK download: https://developer.garmin.com/connect-iq/sdk/
- Graphics docs: https://developer.garmin.com/connect-iq/api-docs/Toybox/Graphics.html
