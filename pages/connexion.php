<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>connexion</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../asserts/dist/style.css">
</head>
<body>
    <section class="bg-gray-50 min-h-screen flex items-center justify-center ">
        <!--login container -->
        <div class="bg-[#e0f2fe] flex rounded-xl shadow-lg max-w-3xl p-5">
            <!--image-->
            <div class="w-1/2 flex flex-col items-center justify-center px-8">
                <p class="md:block hidden text-center grid-cols-3 text-2xl text-[#3871A6] font-bold"> KaayFadiou </p>
                   
                <i class="md:block hidden fa-solid fa-stethoscope text-8xl mt-10 text-[#3871A6]"></i>
            </div>
            <!--form-->
            <div class="md:w-1/2 px-&-">
                <h2 class="font-bold text-2xl text-[#3871A6]">Login</h2>
                <p class="text-sm  mt-4 text-[#3871A6] text-xs">Please enter your login information.</p>
                <form action="" class="flex flex-col gap-4">
                    <input type="text" name="userName" placeholder="Username" id="" class="p-2 mt-8 rounded-xl border w-full">
                    <div class="relative">
                        <input type="password" name="password"
                        placeholder="Password" id="" class="p-2 rounded-xl border w-full">
                        <i class="fa-solid fa-eye absolute text-[#3871A6] top-1 right-3 translate-y-1/2"></i>
                    </div>
                    <button class="bg-[#3871A6] text-white rounded-xl py-2 hover:scale-110 duration-300">Log in</button>
                </form>

                
            </div>
        </div>
        
    </section>
</body>
</html>