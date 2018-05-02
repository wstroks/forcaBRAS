import cv2
import keyboard

video = cv2.VideoCapture(1)
#classificadorFace = cv2.CascadeClassifier('cascades\\Hand.Cascade.1.xml')
classificadorC = cv2.CascadeClassifier('cascades\\sign_language-C-classifier.xml')
classificadorA = cv2.CascadeClassifier('cascades\\sign_language-A-Classifier.xml')
classificadorB = cv2.CascadeClassifier('cascades\\sign_language-B-Classifier.xml')
classificadorD = cv2.CascadeClassifier('cascades\\sign_language-D-classifier.xml')
classificadorR = cv2.CascadeClassifier('cascades\\sign_language-F-Classifier.xml')
classificadorF = cv2.CascadeClassifier('cascades\\sign_language-R-Classifier.xml')


while True:
    conectado, frame= video.read()
   #print(conectado)

    frameCinza = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    FacesDectadas= classificadorC.detectMultiScale(frameCinza,minNeighbors=5)
    #, minSize=(20,20)
    #,minNeighbors=5,scaleFactor=1.08 alterar os valores em diferentes lugares

    for(x,y,l,a) in FacesDectadas:
        cv2.rectangle(frame, (x,y),(x +l, y +a), (0,0,255), 2)
        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(frame, 'C', (100, 400), font, 4, (255, 0, 0), 2)
        if keyboard.is_pressed('c'):
            meunome = "c"
            arq = open("C:/Users/Lenington/Desktop/ForcaBRAS/ForcaBRAS v.0.2/teste.txt", "w")
            arq.write(meunome)
            arq.close()


    cv2.imshow('video', frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):

        break

video.release()
cv2.destroyAllWindows()