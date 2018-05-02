import cv2
import keyboard
import numpy as np

video = cv2.VideoCapture(0)
#classificadorFace = cv2.CascadeClassifier('cascades\\Hand.Cascade.1.xml')
classificadorFace = cv2.CascadeClassifier('cascades\\sign_language-C-classifier.xml')
classificadorA = cv2.CascadeClassifier('cascades\\sign_language-A-Classifier.xml')
classificadorB = cv2.CascadeClassifier('cascades\\sign_language-B-Classifier.xml')
classificadorD = cv2.CascadeClassifier('cascades\\sign_language-D-classifier.xml')
classificadorR = cv2.CascadeClassifier('cascades\\sign_language-F-Classifier.xml')
classificadorF = cv2.CascadeClassifier('cascades\\sign_language-R-Classifier.xml')


while True:
    conectado, frame= video.read()
   #print(conectado)
    cv2.rectangle(frame, (50, 100), (300, 400), (0, 255, 0), 0)
    image = frame[100:400, 50:300]
    # image=cv2.imread('C:\Users\Admin\Desktop\hand.jpg')
    img = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    blur = cv2.GaussianBlur(img, (35, 35), 0)
    ret, thresh = cv2.threshold(blur, 0, 255, 1 + cv2.THRESH_OTSU)
    contours, hierarchy = cv2.findContours(thresh, 1, 1)
    max_area = 0
    pos = 0
    for i in contours:
        area = cv2.contourArea(i)
        if area > max_area:
            max_area = area
            pos = i
    peri = cv2.arcLength(pos, True)
    approx = cv2.approxPolyDP(pos, 0.02 * peri, True)
    hull = cv2.convexHull(pos)

    hull = cv2.convexHull(pos, returnPoints=False)
    defects = cv2.convexityDefects(pos, hull)
    num = 0
    l = defects.shape[0]
    for i in range(1, defects.shape[0]):
        s, e, f, d = defects[i, 0]
        far = tuple(pos[f][0])
        if d > 10000:
            num += 1
            cv2.circle(image, far, 3, [0, 0, 255], -1)
    num += 1;
    if num == 1:
        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(frame, '1', (100, 450), font, 2, (255, 10, 10), 2)
    elif num == 2:
        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(frame, '2', (100, 450), font, 2, (255, 10, 10), 2)
    elif num == 3:
        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(frame, '3', (100, 450), font, 2, (255, 10, 10), 2)


    frameCinza = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    a=cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    FacesDectadas= classificadorFace.detectMultiScale(frameCinza,minNeighbors=5)
    A=classificadorA.detectMultiScale(a,minNeighbors=5)
    #b = classificadorB.detectMultiScale(frameCinza, minNeighbors=5)
    #d = classificadorD.detectMultiScale(frameCinza, minNeighbors=5)
   # r = classificadorR.detectMultiScale(frameCinza, minNeighbors=5)
    #f = classificadorF.detectMultiScale(frameCinza, minNeighbors=5)
    #, minSize=(20,20)
    #,minNeighbors=5,scaleFactor=1.08 alterar os valores em diferentes lugares

    for(x,y,l,a) in FacesDectadas:
        cv2.rectangle(frame, (x,y),(x +l, y +a), (0,0,255), 2)
        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(frame, 'c', (100, 400), font, 4, (255, 0, 0), 2)
        if keyboard.is_pressed('c'):
            meunome = "c"
            arq = open("c.txt", "w")
            arq.write(meunome)
            arq.close()

    for(w,q,u,o) in A:
        #cv2.rectangle(a, (w, q), (w + u, q + o), (0, 0, 255), 2)
        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(frame, 'A', (100, 400), font, 4, (255, 0, 0), 2)

    frame[100:400, 50:300] = image

    cv2.imshow('video', frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):

        break




video.release()
cv2.destroyAllWindows()