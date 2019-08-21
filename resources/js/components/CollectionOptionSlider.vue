<template>
    <hooper :infiniteScroll="true" :itemsToShow="1" :autoPlay="true" :playSpeed="4000" :wheelControl="false" :mouseDrag="false">
        <slide class="relative p-10" v-for="img in images" :key="img.id" >
            <img class="cursor-pointer" :src="'/img/collections/options/' + img.image" :alt="img.alt">
            <p v-if="img.headline" class="collection-option-headline tracking-wider text-gray-600 text-center mt-4">{{ img.headline }}</p>
        </slide>
        <hooper-navigation class="coll-buttons" slot="hooper-addons"></hooper-navigation>
    </hooper>
</template>

<script>
    import { Hooper, Slide, Navigation as HooperNavigation } from 'hooper';
    import 'hooper/dist/hooper.css';


    export default {
        props: ['data'],

        components: {
            Hooper,
            Slide,
            HooperNavigation
        },

        data() {
            return {
                images: this.data
            }
        }
    }
</script>
