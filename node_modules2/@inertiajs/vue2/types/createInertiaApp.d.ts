import { Page } from '@inertiajs/core';
import { Component, PluginObject } from 'vue';
import { InertiaApp, InertiaProps } from './app';
interface CreateInertiaAppProps {
    id?: string;
    resolve: (name: string) => Component | Promise<Component> | {
        default: Component;
    };
    setup: (props: {
        el: Element;
        App: InertiaApp;
        props: {
            attrs: {
                id: string;
                'data-page': string;
            };
            props: InertiaProps;
        };
        plugin: PluginObject<any>;
    }) => void | Vue;
    title?: (title: string) => string;
    progress?: false | {
        delay?: number;
        color?: string;
        includeCSS?: boolean;
        showSpinner?: boolean;
    };
    page?: Page;
    render?: (vm: Vue) => Promise<string>;
}
export default function createInertiaApp({ id, resolve, setup, title, progress, page, render, }: CreateInertiaAppProps): Promise<{
    head: string[];
    body: string;
} | void>;
export {};
