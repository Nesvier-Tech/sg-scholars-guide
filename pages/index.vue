<template>
    <div>
        <h1 class="flex justify-center my-3 text-2xl font-bold">Index Page</h1>
        <ul class="flex flex-col items-center">
            <li class="px-4 my-2 border-2 rounded-md">
                <nuxt-link to="test">Scratch</nuxt-link>
            </li>
            <li class="px-4 my-2 border-2 rounded-md">
                <nuxt-link to="login">Login</nuxt-link>
            </li>
            <li class="px-4 my-2 border-2 rounded-md">
                <nuxt-link to="dashboard">Dashboard</nuxt-link>
            </li>
            <li class="px-4 my-2 border-2 rounded-md">
                <nuxt-link to="upload">Upload Quiz</nuxt-link>
            </li>
            <li class="px-4 my-2 border-2 rounded-md">
                <nuxt-link to="quiz">Take Quiz</nuxt-link>
            </li>
            <li class="px-4 my-2 border-2 rounded-md">
                <nuxt-link to="profile">Profile</nuxt-link>
            </li>
        </ul>
        <h3 class="ml-10 font-bold text-1xl">*Let's temporarily use this as temporary navigator</h3>
    </div>

    <hr>

    <div class="flex flex-col items-center my-10">
        <h2  class="my-3 text-2xl font-bold ">Navigation Map</h2>
        <img src="@/assets/nav-map.png" width="600" height="1000"/>
    </div>
</template>