<template>
    <div>
        <h1>Index Page</h1>
        <ul>
            <li>
                <nuxt-link to="test">Test</nuxt-link>
            </li>
            <li>
                <nuxt-link to="login">Login</nuxt-link>
            </li>
            <li>
                <nuxt-link to="dashboard">Dashboard</nuxt-link>
            </li>
            <li>
                <nuxt-link to="upload">Upload Quiz</nuxt-link>
            </li>
            <li>
                <nuxt-link to="quiz">Take Quiz</nuxt-link>
            </li>
            <li>
                <nuxt-link to="profile">Profile</nuxt-link>
            </li>
        </ul>
        <h3>Let's temporarily use this as temporary navigator</h3>
    </div>

    <hr>

    <div>
        <h2>Navigation Map</h2>
        <img src="@/assets/nav-map.png" width="600" height="1000"/>
    </div>
</template>