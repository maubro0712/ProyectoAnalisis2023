//Ganancia
K=100

//Parámetros físicos
K_t=0.5
K_b=0.5
J_m=0.03
D_m=0.02
R_a=8
a_m=1/J_m *(D_m+(K_t*K_b/R_a))

//Matriz A
A=[0 1 0;
0 -a_m K_t/(R_a*J_m);
-3.18*K 0 -100]
//Vector B
B=[0;
0;
31.8*K]
//Vector C
C=[0.1 0 0]
//Vector D nulo
D=[0]

//Creación de espacio de estados a partir de las matrices
esp_est=syslin('c',A,B,C,D);
disp(esp_est)

//Tiempo de análisis
tiempo=0:0.5:25

//Obtener la respuesta general del sistema y las respuestas de las variables de estado
[resp,estados]=csim('step',tiempo,esp_est,esp_est(6))

disp(estados)


//Graficacion de respuestas de variables de estado
subplot(3,1,1)
plot(tiempo,estados(1,:))
xtitle('Respuesta de la variable x_1')
xlabel('t [s]')
ylabel('amplitud [rad/s]')


subplot(3,1,2)
plot(tiempo,estados(2,:))
xtitle('Respuesta de la variable x_2')
xlabel('t [s]')
ylabel('amplitud [rad/s^2]')

subplot(3,1,3)
plot(tiempo,estados(3,:))
xtitle('Respuesta de la variable e_a')
xlabel('t [s]')
ylabel('amplitud [V]')

figure(1)

//Graficacion de respuesta del sistema

clf()
plot(tiempo,resp)
xtitle('Respuesta del sistema a lazo cerrado a partir de variables de estado')
xlabel('tiempo [s]')
ylabel('Amplitud [rad]')

figure(2)
